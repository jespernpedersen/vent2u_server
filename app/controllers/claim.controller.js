const db = require("../models");
const ClaimRequests = db.claimRequests;
const ClaimStatus = db.claimRequestStatus;
const Op = db.Sequelize.Op;


exports.get = (req, res) => {

    condition = req.params.id ? {
        ID: req.params.id
    } : null;

    ClaimRequests.hasOne(ClaimStatus, {foreignKey: "ID"});
    ClaimStatus.belongsTo(ClaimRequests,  {foreignKey: "ID"});

    ClaimRequests.findAll({
            where: condition,
            include: ClaimStatus,
            attributes: ["ID", "student_id", "vent_id", "approved_by_id"]
        }, )
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving tutorials."
            });
        });
}

exports.create = (req, res) => {

    let claim;

    try {
        claim = {
            student_id: req.body.student_id,
            vent_id: req.body.vent_id
        }

        if (!claim.student_id || !claim.vent_id) throw new exception();

    } catch {
        res.status(412).send({
            message: "Student id and vent id cannot be null"
        });
        return;
    }


    ClaimRequests.create(claim)
        .then(data => {
            res.status(201).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving tutorials."
            });
        });
}

exports.update = (req, res) => {

    if (Object.keys(req.body).length < 5) {
        res.status(412).send({
            message: "There are missing arguments in the request"
        });
        return;
    }

    ClaimRequests.update(req.body, {
            where: {
                ID: req.body.ID
            }
        })
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "An error occurred while updating a claim request"
            });
        });
}