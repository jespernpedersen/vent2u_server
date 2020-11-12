const { presets } = require("../models");

module.exports = app => {
    
    const settings = require("../shared/constants");

    const router = require("express").Router();

    const presets = require("../controllers/preset.controller");
    //const user = 
    //const vent = 
    //const vent = 

    router.get('/', presets.get);
    router.get('/:id', presets.get);
    router.get('/user/:id', presets.getFromUser);

    

    app.use(settings.PATH +'/presets', router);
}