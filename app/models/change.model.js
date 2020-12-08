module.exports = (sequelize, Sequelize) => {
    let Change = sequelize.define("change", {
        ID: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        user_id: {
            type: Sequelize.INTEGER
        },
        vent_id: {
            type: Sequelize.INTEGER
        },
        status_id: {
            type: Sequelize.INTEGER
        },
        time: {
            type: Sequelize.TIME
        }
    }, {
        timestamps: true
    });

    return Change;
};