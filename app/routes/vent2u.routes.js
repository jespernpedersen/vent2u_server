module.exports = app => {

    //import routers here
    require("./vents.routes")(app);
    require("./rooms.routes")(app);
    require("./classes.routes")(app);
    require("./change.routes")(app);
    require("./presets.routes")(app);
    require("./claims.routes")(app);
    require("./claimRequestStatus.routes")(app);
    require("./users.routes")(app);
    require("./login.routes")(app)
};