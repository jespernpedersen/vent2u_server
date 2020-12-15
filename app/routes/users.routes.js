module.exports = app => {

    require("dotenv").config();

    const router = require("express").Router();
    const users = require("../controllers/user.controller");

    // Read,
    router.get('/', users.get);
    router.get('/:id', users.get);
    router.get('/room/:id', users.getFromRoom);
    router.get('/vent/:id', users.getFromVent);

    // Update
    router.put('/', users.update);

    app.use(process.env.DB_PATH  + '/users', router);
}