module.exports = app => {

    //import routers here
    
    require("./rooms.routes")(app);
    require("./classes.routes")(app);
};