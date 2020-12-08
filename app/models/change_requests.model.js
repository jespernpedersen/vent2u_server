module.exports = (sequelize, Sequelize) => {
    let change_requests = sequelize.define("change_requests", {
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

    return change_requests;
};