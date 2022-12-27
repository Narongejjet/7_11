const express = require("express");
const connection = require("../services/database");
const permissionRouter = express.Router();

// INSERT permission
permissionRouter.post("/permissionNew", async (req, res) => {
    const newName = req.body.newName;
    const rows = await connection.query(`INSERT INTO permission (name) VALUES (?)`, [newName])
    if (rows[0].length === 0) {
        return res.status(404).send({
            returnCode: "404", returnMassage: "error", result: {
                massage: "permission exist"
            }
        })
    }
    res.status(201).send({ returnCode: "201", returnMassage: "success", result: "insert new permission successful" })
})

// Update permissionid
permissionRouter.delete("/permission/Delete", async (req, res) => {
    const permissionId = req.body.permissionId;
    const rows = await connection.query('Update permission set status = 2 where permissionId = ?;', [permissionId]);
    if (rows.length === 0) {
        res.status(404).json({ "returncode": "404", message: "error no affect rows " });
    }
    res.status(200).json({ "returncode": "200", message: "success" });
})


// INSERT permission_menu
permissionRouter.post("/permission/Menu", async (req, res) => {
    const roleid = req.body.roleid;
    const permissionid = req.body.permissionid;
    const menuid = req.body.menuid;
    const rows = await connection.query(`INSERT INTO permissionmenu (roleId,permissionId,menuId,status) VALUES (?, ?, ?,1)`, [roleid, permissionid, menuid])
    if (rows[0].length === 0) {
        return res.status(404).send({
            returnCode: "201", returnMassage: "error", result: { massage: "please enter correct information." }
        })
    }
    res.status(201).send({ returnCode: "201", returnMasevsage: "success", result: { "massage": "Update new permission successful" } })

})

// Update permissionrole
permissionRouter.delete("/permissionMenu/delete", async (req, res) => {
    const roleid = req.body.roleid;
    const permissionid = req.body.permissionid;
    const menuid = req.body.menuid;
    const rows = await connection.query('update permissionmenu set status = 2 where roleId = ? and permissionId = ? and menuId = ? ', [ roleid, permissionid, menuid]);
    if (rows.length === 0) {
        res.status(404).json({ "returncode": "404", message: "error no affect rows " });
    }
    res.status(200).json({ "returncode": "200", message: "success" });
})

module.exports = { permissionRouter }
