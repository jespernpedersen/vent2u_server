module.exports = app => {

    //import routers here
    require("./vents.routes")(app);
    require("./rooms.routes")(app);
    require("./claims.routes")(app);
};