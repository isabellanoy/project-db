const express = require('express');
const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');
const pool = require('../config/db');

const router = express.Router();

const ok = (res, data = null, message = 'OK') => 
  res.status(200).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 500) => 
  res.status(status).json({ ok: false, data: null, message });

// Funciones de reporte permitidas
const allowed = {
    ranking_proveedores: "fn_reporte_ranking_proveedores",
    impacto_millas: "fn_reporte_impacto_financiero_millas",
    auditoria_reembolsos: "fn_auditoria_reembolsos",
    paquetes_canjeados: "fn_paquetes_canjeados",
    millas_por_destino: "fn_reporte_millas_por_destino",
};

function escapeXml(s) {
    if (s == null) return "";
    return String(s)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;");
}

function sanitizeName(name) {
    let s = String(name)
        .trim()
        .replace(/[^a-zA-Z0-9_]/g, "_");
    if (/^[0-9]/.test(s)) s = "_" + s;
    return s || "col";
}

function buildJrxmlFromHeaders(headers, title) {
    const cols = headers.length || 1;
    const totalWidth = 555; 
    const colWidth = Math.floor(totalWidth / cols);

    const fieldsXml = headers
        .map((h) => {
            const fieldName = sanitizeName(h);
            return `<field name="${fieldName}" class="java.lang.String"/>`;
        })
        .join("\n  ");

    const headersXml = headers
        .map((h, i) => {
            const x = i * colWidth;
            return `
            <textField textAdjust="StretchHeight">
                <reportElement style="ColumnHeader" x="${x}" y="0" width="${colWidth}" height="30" forecolor="#006699"/>
                <textElement textAlignment="Center" verticalAlignment="Middle">
                    <font size="10" isBold="true"/>
                </textElement>
                <textFieldExpression><![CDATA["${escapeXml(h.toUpperCase())}"]]></textFieldExpression>
            </textField>`;
        })
        .join("\n");

    const detailXml = headers
        .map((h, i) => {
            const x = i * colWidth;
            const safe = sanitizeName(h);
            return `
            <textField textAdjust="StretchHeight" isBlankWhenNull="true">
                <reportElement style="Detail" positionType="Float" x="${x}" y="0" width="${colWidth}" height="20"/>
                <textElement verticalAlignment="Middle">
                    <font size="10"/>
                    <paragraph leftIndent="5" rightIndent="5"/>
                </textElement>
                <textFieldExpression><![CDATA[$F{${safe}}]]></textFieldExpression>
            </textField>`;
        })
        .join("\n");

    // Correct path relative to project root
    const templatePath = path.join(process.cwd(), "database", "templates", "template_base.jrxml");
    
    if (!fs.existsSync(templatePath)) {
        throw new Error(`Template base no encontrado en: ${templatePath}`);
    }

    let tpl = fs.readFileSync(templatePath, "utf8");
    tpl = tpl.replace("{{FIELDS}}", fieldsXml);
    tpl = tpl.replace("{{COLUMN_HEADERS}}", headersXml);
    tpl = tpl.replace("{{DETAIL_FIELDS}}", detailXml);
    return tpl;
}

// Helper para formatear fechas manualmente (DD/MM/YYYY)
function formatDateShort(dateObj) {
    if (!dateObj) return "";
    const day = String(dateObj.getDate()).padStart(2, '0');
    const month = String(dateObj.getMonth() + 1).padStart(2, '0'); // Meses son 0-indexados
    const year = dateObj.getFullYear();
    return `${day}/${month}/${year}`;
}

router.post("/jasper", async (req, res) => {
    try {
        const { fnKey } = req.body;
        if (!fnKey || !allowed[fnKey])
            return res.status(400).json({ error: "fnKey no permitido" });
        const fnName = allowed[fnKey];

        const result = await pool.query(`SELECT * FROM ${fnName}()`);

        const headers = result.fields.map((f) => f.name);
        
        const rows = result.rows.map((r) => {
            const obj = {};
            headers.forEach((h) => {
                let val = r[h];
                if (val instanceof Date) {
                    val = formatDateShort(val);
                } else {
                    val = val != null ? String(val) : "";
                }
                const safe = sanitizeName(h);
                obj[safe] = val;
            });
            return obj;
        });

        const reportsDir = path.join(process.cwd(), "reports");
        if (!fs.existsSync(reportsDir))
            fs.mkdirSync(reportsDir, { recursive: true });
            
        const dataPath = path.join(reportsDir, "data.json");
        fs.writeFileSync(dataPath, JSON.stringify({ rows }, null, 2), "utf8");

        const jrxmlContent = buildJrxmlFromHeaders(
            headers,
            `Reporte: ${fnKey.replace(/_/g, " ").toUpperCase()}`
        );
        const jrxmlPath = path.join(reportsDir, "report_dynamic.jrxml");
        fs.writeFileSync(jrxmlPath, jrxmlContent, "utf8");

        await new Promise((resolve, reject) => {
            exec(
                `jasperstarter compile "${jrxmlPath}"`, 
                (err, stdout, stderr) => {
                    if (err) {
                        console.error("compile err", stderr || stdout);
                        return reject(new Error(stderr || stdout));
                    }
                    resolve(stdout);
                }
            );
        });

        const jasperFile = path.join(reportsDir, "report_dynamic.jasper");
        const outBase = path.join(reportsDir, "out_report");
        
        await new Promise((resolve, reject) => {
            const cmd = `jasperstarter pr "${jasperFile}" -f pdf -o "${outBase}" -t json --json-query rows --data-file "${dataPath}" -P title="Reporte ${fnName}"`;
            exec(cmd, (err, stdout, stderr) => {
                if (err) {
                    console.error("run err", stderr || stdout);
                    return reject(new Error(stderr || stdout));
                }
                resolve(stdout);
            });
        });

        const pdfPath = path.join(reportsDir, "out_report.pdf");
        if (!fs.existsSync(pdfPath))
            return res.status(500).json({ error: "No se generó PDF" });
            
        const pdf = fs.readFileSync(pdfPath);
        res.setHeader("Content-Type", "application/pdf");
        res.setHeader(
            "Content-Disposition",
            `inline; filename="${fnName}.pdf"`
        );
        res.send(pdf);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
