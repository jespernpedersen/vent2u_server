module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define("user", {
        ID: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        name: {
            type: Sequelize.STRING
        },
        vent_id: {
            type: Sequelize.INTEGER
        },
        logged_in: {
            type: Sequelize.BOOLEAN
        },
        user__role_id: {
            type: Sequelize.INTEGER
        }
    }, {
        timestamps: false
    });

    return User;
};