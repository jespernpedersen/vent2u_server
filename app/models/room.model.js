module.exports = (sequelize, Sequelize) => {
    const Room = sequelize.define("room", {
      ID: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      name: {
        type: Sequelize.STRING
      },
      grid_size: {
        type: Sequelize.INTEGER
      }
    },
    {
      timestamps: false
    });
  
    return Room;
  };