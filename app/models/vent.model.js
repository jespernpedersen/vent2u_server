module.exports = (sequelize, Sequelize) => {
    const Vent = sequelize.define("vent", {
        ID: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        vent_group_id: {
            type: Sequelize.INTEGER
        }
    }, {
        timestamps: false
    });

    return Vent;
};