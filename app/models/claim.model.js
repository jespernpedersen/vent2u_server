module.exports = (sequelize, Sequelize) => {
    const Claim = sequelize.define("claimrequests", {
      ID: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      student_id: {
        type: Sequelize.INTEGER
      },
      vent_id: {
        type: Sequelize.INTEGER
      },
      status_id: {
        type: Sequelize.INTEGER
      },
      approved_by_id: {
        type: Sequelize.INTEGER
      }
    },
    {
      timestamps: false
    });
  
    return Claim;
  };