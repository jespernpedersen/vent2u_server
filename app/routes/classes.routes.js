
module.exports = app => {
    
    const settings = require("../shared/constants");
    const router = require("express").Router();
    const classes = require("../controllers/class.controller");

    router.get('/', classes.get);
    router.get('/:id', classes.get);
    router.get('/rooms/:id', classes.getFromRoom);

    app.use(settings.PATH +'/classes', router);
}