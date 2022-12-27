const express = require("express");
const connection = require("../services/database");
const roleRouter = express.Router();

roleRouter.put("/maprole/updateStatus", async (req, res) => {
    const firstName = req.body.firstName;
    const employeeId = Number(req.body.employeeId);
    const roleId = req.body.roleId;
    const status = (req.body.status);
    const rows1 = await connection.query("update maproles set status = ?, approvedBy = ? WHERE roleId = ? and firstName = ? ", [status, employeeId, roleId, firstName])
    if (rows1[0].affectedRows === 0) {
        res.status(404).send({ message: "Unsuccessful" })
    } else if (rows1[0].affectedRows === 1) {
        // success  
        res.status(201).send({ returnCode: "201", message: "update successful." })
    }
})

roleRouter.get("/maprole/mapId/:mapId", async (req, res) => {
    const mapId = req.params.mapId;
    const rows = await connection.query("SELECT * from maproles where mapId = ?", [mapId]);
    if (rows[0].length == 0) {
        return res.status(404).send({ returnCode: "404", message: "error", result: "MapID not found." })
    }
    // success
    res.status(201).send({ returnCode: "201", message: "Success", result: rows[0] });
})

roleRouter.get("/maprole/employee/:employeeId", async (req, res) => {
    const employeeId = req.params.employeeId;
    const rows = await connection.query("select r.name ,m.firstName ,m.lastName , m.status from maproles m left join employee e on m.calls = e.calls left join roles r on m.mapId = r.id  where e.employeeId =?", [employeeId]);
    if (rows[0].length == 0) {
        return res.status(404).send({ returnCode: "404", message: "error", result: "EmployeeID is incorrect." })
    }
    // success
    res.status(201).send({ returnCode: "201", message: "Success", result: rows[0] });
})

roleRouter.get("/roleMenucheck/menu", async (req, res) => {
    const role = req.body.roleName;
    const menu = req.body.menuName;
    const roleMenu = await connection.query(
        "select r.name as role ,m.nameMenu as menu from roles r left join permissionmenu p on r.id  = p.roleId left join menu m  on p.menuId  = m.menuId left join permission p2 on p.permissionId  = p2.permissionId where r.name = ? and m.nameMenu = ?", [role, menu])
    const permission = await connection.query(
        'select p.permissionId, p2.name as permission from roles r left join permissionmenu p on r.id  = p.roleId left join menu m  on p.menuId  = m.menuId left join permission p2 on p.permissionId  = p2.permissionId where r.name = ? and m.nameMenu = ?', [role, menu])
    const roleName = roleMenu[0][0].role
    const menuName = roleMenu[0][0].menu
    const permissionList = permission[0]
    if (roleMenu[0].length == 0) {
        return res.status(404).send({ returnCode: "404", returnMessage: "roleId is incorrect." })
    }
    res.status(201).send({ returnCode: "201", returnMessage: "Success", result: { roleName, menuName, permissionList } });
})

//หา roleId 'นี้' ว่าสามารถ ทำอะไรได้บ้าง
roleRouter.get("/roleMenucheck/check/:roleId", async (req, res) => {
    const roleId = req.params.roleId;
    const rows = await connection.query(
        "select r.name as roleName from roles r left join permissionmenu p on r.id  = p.roleId left join menu m on p.menuId  = m.menuId left join permission p2 on p.permissionId  = p.permissionId where p.roleId  =  ?", [roleId])
    const menu = await connection.query(
        "select m.menuId  , m.nameMenu  from roles r left join permissionmenu p2  on r.id  = p2.roleId left join menu m on p2.menuId  = m.menuId left join permission p on p2.permissionId  = p.permissionId where p2.roleId  = ?", [roleId])
    const roleName = rows[0][0].roleName
    const menulist = menu[0]

    if (rows[0].length == 0) {
        return res.status(404).send({ returnCode: "404", returnMessage: "roleId is incorrect." })
    }
    res.status(201).json({ returnCode: "201", returnMessage: "Success", result: { roleName: roleName, menuList: menulist } });
})

module.exports = { roleRouter }