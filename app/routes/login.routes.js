module.exports = app => {

    const settings = require("../shared/constants");

    const router = require("express").Router();

    const login = require("../controllers/login.controller");

    router.post('/login', login.post);
    router.post('/logout', login.post);
    

    app.use(settings.PATH , router);
}