const db = require("../models");


exports.login = (req, res) => {

    const Sequelize = require("sequelize");
    const sequelize = new Sequelize('vent2u', 'manager', ']SgtSF~BG)8WN^%p', {
        host: "localhost",
        dialect: "mysql",
        port: 3306,
        syncOnAssociation: false
    });
    const query = `call login(?, ?)`;

    sequelize.query(query, {
            replacements: [req.body.email, req.body.password],
            type: sequelize.QueryTypes.SELECT
        }).then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send(err);
        });
}