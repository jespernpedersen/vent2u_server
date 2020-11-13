const Sequelize = require("sequelize");
const sequelize = new Sequelize('vent2u', 'manager', ']SgtSF~BG)8WN^%p', {
    host: "localhost",
    dialect: "mysql",
    port: 3306,
    syncOnAssociation: false
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.rooms = require("./room.model.js")(sequelize, Sequelize);
//db.vents = require("./tutorial.model.js")(sequelize, Sequelize);
//db.claimRequests = require("./tutorial.model.js")(sequelize, Sequelize);
//db.users = require("./tutorial.model.js")(sequelize, Sequelize);
db.vents = require("./vent.model.js")(sequelize, Sequelize);
db.classes = require ("./class.model.js") (sequelize, Sequelize);

module.exports = db;