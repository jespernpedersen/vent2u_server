module.exports = app => {

    require("dotenv").config();

    const router = require("express").Router();
    const vents = require("../controllers/vent.controller");

    // Read,
    router.get('/', vents.get);
    router.get('/:id', vents.get);
    router.get('/room/:id', vents.getFromRoom);
    router.get('/user/:id', vents.getFromUser);

    // Create, Update
    router.put('/', vents.update);

    app.use(process.env.PATH + '/vents', router);
}