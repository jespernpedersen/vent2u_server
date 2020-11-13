
module.exports = app => {
    
    const settings = require("../shared/constants");

    const router = require("express").Router();

    const classes = require("../controllers/class.controller");
    //const user = 
    //const vent = 
    //const vent = 

    router.get('/', classes.get);
    router.get('/:id', classes.get);
    router.get('/rooms/:id', classes.getFromRoom);

    app.use(settings.PATH +'/classes', router);
}