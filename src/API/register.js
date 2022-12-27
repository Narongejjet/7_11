const express = require("express");
const connection = require("../services/database");
const registerRouter = express.Router();

registerRouter.post("/register", async (req, res) => {
    const roleId = req.body.roleId;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;
    const calls = req.body.calls;
    const email = req.body.Email;
    const sectionsId = req.body.sectionsId;
    const rows = await connection.query("insert into maproles (roleId,firstName,lastName,calls ,Email,sectionsId) values (?,?,?,?,?,?)",[roleId,firstName,lastName,calls,email,sectionsId])
    if (rows[0].length == 0) {
        return res.status(404).send({ returnCode: "404", returnMessage: "ID is incorrect." })
    }
    res.status(201).send({ returnCode: "201", returnMessage: "Success", result: rows[0][0] });
})

module.exports = { registerRouter }