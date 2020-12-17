const db = require("../models");
const Vents = db.vents;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {
    condition = req.params.id ? { ID: req.params.id } : null;

    Vents.findAll({ where: condition, order: ["ID", "ASC"] })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving vents."
            });
        });
}

exports.getFromRoom = (req, res) => {

    const query = `SELECT * from v_vents WHERE room_ID = ?`;

    db.sequelize.query(query, {
        replacements: [req.params.id],
        type: db.sequelize.QueryTypes.SELECT
      }).then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send(err.original.sqlMessage);
    });
}

exports.getFromUser = (req, res) => {

    condition = req.params.id ? { user_id: req.params.id } : null;

    Vents.findOne({ where: condition })
    .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
            message: "Finding vent that belongs to user " + id
        });
    });
}

exports.update = (req, res) => {
    const id = req.body.ID;
    Vents.update(req.body, {
            where: { ID: id }
        })
        .then(num => {
            console.log(num);
            if (num == 1) {
                res.send({
                    message: "Vent was updated successfully."
                });
            } else {
                res.send({
                    message: `No changes detected for vent with id ` + id
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating Vent with id=" + id
            });
        });
}