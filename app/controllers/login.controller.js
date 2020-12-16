const db = require("../models");


exports.login = (req, res) => {

    const query = `call login(?, ?)`;

    db.sequilize.query(query, {
            replacements: [req.body.email, req.body.password],
            type: sequelize.QueryTypes.SELECT
        }).then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send(err);
        });
}