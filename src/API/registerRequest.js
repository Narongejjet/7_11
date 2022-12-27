const express = require("express");
const connection = require("../services/database");
const regisRequestRouter = express.Router();

//query registers by roleid
regisRequestRouter.get("/maproles/role/:roleid", async (req, res) => {
    const rows = await connection.query(
        "SELECT * FROM maproles  WHERE roleId=" + req.params.roleid
    );
    if (rows[0].length == 0) {
        return res.status(400).json({
            Returncode: "404",
            ReturnMessage: "Not found",
            Result: "RoleID doesn't exist",
        });
    }
    res
        .status(200)
        .json({ Returncode: "200", ReturnMessage: "Success", Result: rows[0] });
});
//query register by sectionid
regisRequestRouter.get("/maproles/section/:sectionid", async (req, res) => {
    const rows = await connection.query(
        "SELECT * FROM maproles WHERE sectionsId=" + req.params.sectionid
    );
    if (rows[0].length == 0) {
        return res.status(400).json({
            Returncode: "404",
            ReturnMessage: "Not found",
            Result: "SectionID doesn't exist",
        });
    }
    res
        .status(200)
        .json({ Returncode: "200", ReturnMessage: "Success", Result: rows[0] });
});
//query registers all limit = 10
regisRequestRouter.get("/maproles", async (req, res) => {
    const limit = req.body.limit;
    const offset = req.body.offset;
    const rows = await connection.query("SELECT * From maproles limit ? offset ?",[limit,offset]);
    if (rows[0].length == 0) {
        return res.status(404).send({ message: "Not found" });
    }
    console.log(rows[0].length == 0);
    res
        .status(200)
        .send({ returncode: "200", message: "Success", result: rows[0] });
});

module.exports = { regisRequestRouter }