module.exports = (sequelize, Sequelize) => {
    const Vent = sequelize.define("vent", {
        ID: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        temperature: {
            type: Sequelize.INTEGER
        },
        humidity: {
            type: Sequelize.INTEGER
        },
        oxygen_level: {
            type: Sequelize.INTEGER
        },
        user_id: {
            type: Sequelize.INTEGER
        },
        vent_group_id: {
            type: Sequelize.INTEGER
        },
        presets_id: {
            type: Sequelize.INTEGER
        }
    }, {
        timestamps: false
    });

    return Vent;
};