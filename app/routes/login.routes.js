module.exports = app => {

    require("dotenv").config();

    const router = require("express").Router();
    const login = require("../controllers/login.controller");

    router.post('/login', login.login);

    console.log(process.env.DB_PATH);

    app.use(process.env.DB_PATH , router);
}