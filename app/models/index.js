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
db.presets = require("./preset.model.js")(sequelize, Sequelize);
db.vents = require("./vent.model.js")(sequelize, Sequelize);
db.claimRequests = require("./claim.model.js")(sequelize, Sequelize);

module.exports = db;