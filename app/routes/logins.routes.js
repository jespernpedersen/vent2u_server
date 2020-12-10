
module.exports = app => {
    
    const settings = require("../shared/constants");
    const router = require("express").Router();
    const logins = require("../controllers/login.controller");

    router.get('/', logins.get);
    router.get('/:id', logins.get);

    
    app.use(settings.PATH +'/logins', router);
}