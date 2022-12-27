const express = require("express");
const connection = require("../services/database");
const loginRouter = express.Router();

loginRouter.post("/login", async (req, res) => {
    const id = req.body.id;
    const rows = await connection.query("SELECT * FROM employee WHERE employeeId = ?", [id])

    if (rows[0].length === 0) {
        return res.status(404).send({ returnCode: "404", returnMessage: "ID is incorrect." })

    }
    res.status(201).send({ returnCode: "201", returnMessage: "Success", result: rows[0][0] });
})


module.exports = { loginRouter}