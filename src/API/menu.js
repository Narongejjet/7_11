const express = require("express");
const connection = require("../services/database");
const menuRouter = express.Router();

//findone✅
menuRouter.get('/menu/fineOne/:menuid', async (req, res) => {
    const menuid = req.params.menuid;
    const menu = await connection.query('SELECT * FROM menu where menuId = ?;', [menuid]);
    if (menu[0].length === 0) {
        res.status(404).json({ "returncode": "404", message: "error", result: { message: "MenuId doesn't exist" } });
    } else {
        res.status(200).json({ "returncode": "200", message: "success", result: menu[0] });
    }

})

//insertข้อมูล✅
menuRouter.post('/menu/insert', async (req, res) => {
    const menuname = String(req.body.menuname);
    const permission = String(req.body.permission);
    const menu = await connection.query('select * from menu where nameMenu = ?;', [menuname]);
    if (menu[0][1] !== [menuname]) {
        await connection.query('insert into menu (nameMenu, permission) values (?,?)', [menuname, permission]);
        res.status(200).json({ returncode: "200", message: "success", result: { message: "Insert new menu successful" } });
    } else {
        res.status(404).json({ returncode: "404", message: "error", result: { message: "menu " + menuname + " exist" } });
    }
    await connection.query('insert into menu (nameMenu, permission) values (?,?);', [menuname], [permission]);
})

///ลบ✅
menuRouter.delete("/menu/delete", async (req, res) => {
    const id = Number(req.body.id);
    const menu = await connection.query('update menu set status = 2 where menuId = ?;', [id]);
    console.log(menu)
    if (menu[0].length == 0) {
        res.status(404).json({ "returncode": "404", message: "error no affect rows " });
    }
    res.status(200).json({ "returncode": "200", message: "success" });
})

//find all✅
menuRouter.get('/menu', async (req, res) => {
    const menu = await connection.query('select * from menu;')
    res.status(200).json({ "returncode": "200", message: "success", result: menu[0] });
})
module.exports = { menuRouter}