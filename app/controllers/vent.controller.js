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

exports.post = (req, res) => {
    // ID
    condition = req.params.id ? { ID: req.params.id } : null;
    // Data sent from Frontend
    const body = req.body[0];
    Vents.findOne({ where: condition }).then(vent => {
            // res.send(vent);
            if (vent) {
                vent.update({
                        temperature: body.temperature,
                        humidity: body.humidity
                    })
                    // res.send("Updated vent: " + req.params.id)
            }
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Could not update vent data."
            });
        });
}