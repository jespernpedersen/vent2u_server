module.exports = app => {

    const settings = require("../shared/constants");

    const router = require("express").Router();

    const vents = require("../controllers/vent.controller");

    router.get('/', vents.get);
    router.get('/:id', vents.get);

    app.use(settings.PATH + '/vents', router);
}