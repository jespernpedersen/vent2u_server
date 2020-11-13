module.exports = app => {

    const settings = require("../shared/constants");
    const router = require("express").Router();
    const status = require("../controllers/claimRequestStatus.controller");

    router.get('/', status.get);
    router.get('/:id', status.get);

    app.use(settings.PATH + '/claimstatus', router);
}