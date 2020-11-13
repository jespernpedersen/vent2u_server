module.exports = (sequelize, Sequelize) => {
    let Class = sequelize.define("classes", {
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