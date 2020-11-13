module.exports = app => {

    const settings = require("../shared/constants");

    const router = require("express").Router();

    const rooms = require("../controllers/room.controller");

    router.get('/', rooms.get);
    router.get('/:id', rooms.get);

    app.use(settings.PATH + '/rooms', router);
}