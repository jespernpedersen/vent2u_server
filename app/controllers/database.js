const dbClient = require('sequilize');
let db;

module.exports.connectDB = async () => {
  const client = new Sequelize(process.env.DB_CONN_STRING, {
    host: process.env.DB_HOST,
    dialect: process.env.DB_DIALECT,
    protocol: process.env.DB_PROTOCOL,
    port: process.env.DB_PORT,
    syncOnAssociation: false
});

  db = client;
}

module.exports.getDB = () => {
  return db
}