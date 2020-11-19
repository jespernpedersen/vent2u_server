module.exports = (sequelize, Sequelize) => {
    let Login = sequelize.define("logins", {
      ID: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      name: {
        type: Sequelize.STRING
      },
      email: {
        type: Sequelize.STRING
      },
      password: {
        type: Sequelize.STRING
      },
      loggedin: {
        type: Sequelize.INTEGER
      },
      user_role_id: {
        type: Sequelize.INTEGER
      }
    },
    {
      timestamps: false
    });
  
    return Login;
  };