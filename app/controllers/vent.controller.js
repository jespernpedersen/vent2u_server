const db = require("../models");
const Vents = db.vents;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {
    condition = req.params.id ? { ID: req.params.id } : null;

    Vents.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving vents."
            });
        });
}

exports.update = (req, res) => {
    const id = req.body.ID;
    Vents.update(req.body, {
            where: { id: id }
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