module.exports = app => {

    require("dotenv").config();

    const router = require("express").Router();
    const rooms = require("../controllers/room.controller");

    router.get('/', rooms.get);
    router.get('/:id', rooms.get);
    

    app.use(process.env.DB_PATH + '/rooms', router);
}