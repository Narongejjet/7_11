const express = require("express");

const app = express();
const { loginRouter } = require("./src/API/login");
const { registerRouter } = require("./src/API/register");
const { roleRouter } = require("./src/API/role");
const { menuRouter } = require("./src/API/menu");
const { employeeRouter } = require("./src/API/employee");
const { regisRequestRouter } = require("./src/API/registerRequest");
const { permissionRouter } = require("./src/API/permission");

app.use(express.json());
app.use(express.urlencoded({ extended: true }))

app.use(loginRouter);
app.use(registerRouter);
app.use(roleRouter);
app.use(menuRouter);
app.use(employeeRouter);
app.use(regisRequestRouter);
app.use(permissionRouter);

app.listen(3000, () => {
    console.log("Server is running at port 3000")
})
