module.exports = (sequelize, Sequelize) => {
    let requested_changes = sequelize.define("requested_changes", {
        ID: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        request_id: {
            type: Sequelize.INTEGER
        },
        option_id: {
            type: Sequelize.INTEGER
        },
    }, {
        timestamps: false
    });

    return requested_changes;
};