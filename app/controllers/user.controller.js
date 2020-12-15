const db = require("../models");
const Users = db.users;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    let query = `SELECT * from v_users`;
    query += req.params.id ? " WHERE ID = ?;" : ";";

    db.query(query, {
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

    const query = `SELECT * from v_users WHERE room_id = ?`;

    db.query(query, {
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

    const query = `SELECT * from v_users WHERE vent_id = ?`;

    db.query(query, {
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
    const id = req.body.ID;
    console.log(req.body);
    Users.update(req.body, {
            where: { ID: id }
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