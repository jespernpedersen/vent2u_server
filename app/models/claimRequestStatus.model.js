module.exports = (sequelize, Sequelize) => {
  const status = sequelize.define("claimrequeststatus", {
      ID: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      name: {
        type: Sequelize.STRING,
        primaryKey: true
      }
    },
    {
      timestamps: false,
      freezeTableName: true
    });

  return status;
};