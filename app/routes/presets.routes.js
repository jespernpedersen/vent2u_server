const { presets } = require("../models");

module.exports = app => {
    
    require("dotenv").config();
    const settings = require("../shared/constants");
    const router = require("express").Router();
    const presets = require("../controllers/preset.controller");

    router.get('/', presets.get);
    router.get('/:id', presets.get);
    router.get('/user/:id', presets.getFromUser);

    app.use(process.env.PATH  +'/presets', router);
}