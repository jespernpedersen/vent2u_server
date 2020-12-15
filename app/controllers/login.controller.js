const db = require("../models");
require('dotenv').config()

exports.login = (req, res) => {

    import 'connection.js';

    const query = `call login(?, ?)`;
    sequelize.query(query, {
        replacements: [req.body.email, req.body.password],
        type: sequelize.QueryTypes.SELECT
    }).then(data => {
        res.send(data);
    }).catch(err => {
        res.status(500).send(err);
    });
}