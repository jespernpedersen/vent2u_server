const db = require("../models");
const Users = db.users;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    const Sequelize = require("sequelize");
    const sequelize = new Sequelize('vent2u', 'manager', ']SgtSF~BG)8WN^%p', {
        host: "localhost",
        dialect: "mysql",
        port: 3306,
        syncOnAssociation: false
    });

    let query = `SELECT * from v_users`;
    query += req.params.id ? " WHERE ID = ?;" : ";";

    sequelize.query(query, {
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
    const Sequelize = require("sequelize");
    const sequelize = new Sequelize('vent2u', 'manager', ']SgtSF~BG)8WN^%p', {
        host: "localhost",
        dialect: "mysql",
        port: 3306,
        syncOnAssociation: false
    });

    const query = `SELECT * from v_users WHERE room_id = ?`;

    sequelize.query(query, {
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
    const Sequelize = require("sequelize");
    const sequelize = new Sequelize('vent2u', 'manager', ']SgtSF~BG)8WN^%p', {
        host: "localhost",
        dialect: "mysql",
        port: 3306,
        syncOnAssociation: false
    });

    const query = `SELECT * from v_users WHERE vent_id = ?`;

    sequelize.query(query, {
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