module.exports = app => {

    require("dotenv").config();

    const settings = require("../shared/constants");

    const router = require("express").Router();

    const login = require("../controllers/login.controller");

    router.post('/login', login.login);

    app.use(process.env.PATH , router);
}