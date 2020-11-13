module.exports = (sequelize, Sequelize) => {
    const Class = sequelize.define("class", {
      ID: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      name: {
        type: Sequelize.STRING
      },
      room_id: {
        type: Sequelize.INTEGER
      }
    },
    {
      timestamps: false
    });
  
    return Class;
  };