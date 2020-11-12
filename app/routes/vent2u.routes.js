module.exports = app => {

    //import routers here
    
    require("./rooms.routes")(app);
    require("./presets.routes")(app);

    
};