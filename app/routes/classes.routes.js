
module.exports = app => {
    
    require("dotenv").config();
    
    const settings = require("../shared/constants");
    const router = require("express").Router();
    const classes = require("../controllers/class.controller");

    router.get('/', classes.get);
    router.get('/:id', classes.get);
    router.get('/rooms/:id', classes.getFromRoom);

    app.use(process.env.PATH  +'/classes', router);
}