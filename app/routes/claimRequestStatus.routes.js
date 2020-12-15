module.exports = app => {

    require("dotenv").config();

    const settings = require("../shared/constants");
    const router = require("express").Router();
    const status = require("../controllers/claimRequestStatus.controller");

    router.get('/', status.get);
    router.get('/:id', status.get);

    app.use(process.env.PATH + '/claimstatus', router);
}