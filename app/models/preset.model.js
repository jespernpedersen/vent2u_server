module.exports = (sequelize, Sequelize) => {
  const Preset = sequelize.define("preset", {
      ID: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      name: {
        type: Sequelize.STRING
      },
      temperature: {
        type: Sequelize.INTEGER
      },

      humidity: {
        type: Sequelize.INTEGER
      },

      user_id: {
        type: Sequelize.INTEGER
      }
    },
    {
      timestamps: false
    });

  return Preset;
};