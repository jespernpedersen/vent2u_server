module.exports = app => {

    //import routers here
    require("./vents.routes")(app);
    require("./rooms.routes")(app);
    require("./presets.routes")(app);
    require("./claims.routes")(app);
};