const express = require("express");
const connection = require("../services/database");
const employeeRouter = express.Router();

//GET หา Employee ทั้งหมด ✔️
employeeRouter.get('/employee', async (req, res) => {
    const A1 = await connection.query('SELECT * FROM employee;')
    res.status(200).json({ ReturnCode: "200", ReturnMessage: "Success", Result: A1[0] })
})

//GET หา Employee โดยใช้ params จาก ID ✔️
employeeRouter.get('/employee/:id', async (req, res) => {
    const B = await connection.query('SELECT * FROM employee WHERE employeeId=' + req.params.id);
    if (B[0].length == 0) {
        return res.status(404).json({ ReturnCode: "404", ReturnMessage: "Not Fround", Result: "EmployeeID doesn't exist" });
    }
    res.status(200).json({ ReturnCode: "200", ReturnMessage: "Success", Result: B[0] })
});

//Delete Employee โดยใช้ params จาก ID ✔️
employeeRouter.delete('/employee/delete/:id', async (req, res) => {
    const D = await connection.query('DELETE FROM employee WHERE employeeId = ' + req.params.id);
    if (D[0].affectedRows === 0) {
        return res.status(404).json({ ReturnCode: "404", ReturnMessage: "Not Fround" });
    } else {
        res.status(200).json({ ReturnCode: "200", ReturnMessage: "Success", Result:"DeleteId successful"})
    }
});

//GET หา Employee โดยกำหนด Limit+offset ได้จาก Body ✔️ 
employeeRouter.get('/employeeLimit', async (req, res) => {
    const limit = req.body.limit;
    const offset = req.body.offset;
    const A2 = await connection.query('SELECT * FROM employee limit ? offset ?;', [limit, offset])
    if (A2[0].length == 0) {
        return res.status(404).json({ ReturnCode: "404", ReturnMessage: "Error" });
    }
    res.status(200).json({ ReturnCode: "200", ReturnMessage: "Success", Result: A2[0] })
});

//GET หา Employee โดยหาจาก Sections_ID ✔️ 
employeeRouter.get('/employeeSection', async (req, res) => {
    const sectionsId = Number(req.body.sectionsId) ;
    const sectionKeep = await connection.query("select s.name from sections s left join maproles m on s.id = m.sectionsId left join employee e on m.firstName = e.firstName where m.sectionsId = ?",[sectionsId]);
    const section = sectionKeep[0][0].name
    const nameKeep = await connection.query("select m.roleId ,m.firstName from maproles m left join employee e on m.firstName = e.firstName where m.sectionsId = ? ",[sectionsId])
    const name = nameKeep[0]
    if (sectionKeep[0].length == 0) {
        return res.status(404).json({ ReturnCode: "404", ReturnMessage: "Not Fround", Result: "SectionsID doesn't exist" });
    }
    res.status(200).json({ ReturnCode: "200", ReturnMessage: "Success", Result:{section,name} })
});

//GET หา Employee โดยดูว่าเป็น Role อะไรบ้าง ✔️ 
employeeRouter.get('/employeeRole', async (req, res) => {
    const employee = req.body.employee
    const E = await connection.query('select e.employeeid as employeeId, e.firstName as firstName, e.lastName as lastName, m.status, s.name as sections from employee e left join maproles m  on e.firstName  = m.firstName left join roles r  on m.roleId  = r.id left join sections s  on m.sectionsId  = s.id where e.employeeId  = ?', [employee]);
    const R = await connection.query('select r.name as rolename from employee e left join maproles m  on e.firstName  = m.firstName left join roles r  on m.roleId  = r.id left join sections s  on m.sectionsId  = s.id where e.employeeId  = ?', [employee]);
    const employeeId = E[0][0].employeeId
    const fristName = E[0][0].fristName
    const lastName = E[0][0].lastName
    const status = E[0][0].status
    const sections = E[0][0].sections
    const roles = R[0]
    if (E[0].length == 0) {
        return res.status(404).json({ ReturnCode: "404", ReturnMessage: "Not Fround", Result: "Employee doesn't exist" });
    }
    res.status(200).json({ ReturnCode: "200", ReturnMessage: "Success", Result: { employeeId, fristName, lastName, status, sections, roles } })
});

module.exports = { employeeRouter}