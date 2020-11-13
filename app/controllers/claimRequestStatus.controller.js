const {
    exception
} = require("console");
const db = require("../models");
const ClaimRequestStatus = db.claimRequestStatus;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    condition = req.params.id ? { ID: req.params.id} : null;

    ClaimRequestStatus.findAll({
            where: condition
        })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving tutorials."
            });
        });
}
