exports.get = (req, res) => {

    const db = require("../models");

    let query = `SELECT * from v_users`;
    query += req.params.id ? " WHERE ID = ?;" : ";";

    db.users.query(query, {
        replacements: [req.params.id],
        type: sequelize.QueryTypes.SELECT
      }).then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving users."
            });
        });
}

exports.getFromRoom = (req, res) => {
    
    const db = require("../models");
    const query = `SELECT * from v_users WHERE room_id = ?`;

    db.users.query(query, {
        replacements: [req.params.id],
        type: sequelize.QueryTypes.SELECT
      }).then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send(err.original.sqlMessage);
    });
}

exports.getFromVent = (req, res) => {

    const db = require("../models");
    const query = `SELECT * from v_users WHERE vent_id = ?`;

    db.users.query(query, {
        replacements: [req.params.id],
        type: sequelize.QueryTypes.SELECT
      }).then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send(err.original.sqlMessage);
    });
}

exports.update = (req, res) => {

    const db = require("../models");

    db.users.update(req.body, {
            where: { ID: req.body.id }
        })
        .then(num => {
            console.log(num);
            if (num == 1) {
                res.send({
                    message: "User was updated successfully."
                });
            } else {
                res.send({
                    message: `No changes detected for User `
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating user"
            });
        });
}