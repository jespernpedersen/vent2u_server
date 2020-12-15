require("dotenv").config();

const Sequelize = require("sequelize");
const sequelize = new Sequelize(process.env.DB_CONN_STRING, {
    host: process.env.DB_HOST,
    dialect: process.env.DB_DIALECT,
    protocol: process.env.DB_PROTOCOL,
    dialectOptions: {
        ssl: false
    },
    port: process.env.DB_PORT,
    syncOnAssociation: false
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.users = require("./user.model.js")(sequelize, Sequelize);
db.rooms = require("./room.model.js")(sequelize, Sequelize);
db.vents = require("./vent.model.js")(sequelize, Sequelize);
db.classes = require("./class.model.js")(sequelize, Sequelize);
db.presets = require("./preset.model.js")(sequelize, Sequelize);
db.claimRequests = require("./claim.model.js")(sequelize, Sequelize);
db.change_requests = require("./change_requests.model.js")(sequelize, Sequelize);
db.claimRequestStatus = require("./claimRequestStatus.model.js")(sequelize, Sequelize);
db.requested_changes = require("./requested_changes.model")(sequelize, Sequelize);

module.exports = db;