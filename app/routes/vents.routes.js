module.exports = app => {

    const settings = require("../shared/constants");

    const router = require("express").Router();

    const vents = require("../controllers/vent.controller");
    const classes = require("../controllers/class.controller");

    // Read
    router.get('/', vents.get);
    router.get('/:id', vents.get);
    router.get('/room/:id', vents.getFromRoom);
    router.get('/user/:id', vents.getFromUser);
    router.get('/classes/:id', classes.get);

    // Create, Update
    router.put('/', vents.update);

    app.use(settings.PATH + '/vents', router);
}