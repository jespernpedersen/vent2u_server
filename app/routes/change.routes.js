module.exports = app => {

    require("dotenv").config();

    const settings = require("../shared/constants");
    const router = require("express").Router();
    const change = require("../controllers/change.controller");

    router.post('/', change.post);
    router.get('/', change.get);

    app.use(process.env.PATH  + '/change', router);
}