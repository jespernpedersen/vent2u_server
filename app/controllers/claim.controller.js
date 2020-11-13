const {
    exception
} = require("console");
const db = require("../models");
const ClaimRequests = db.claimRequests;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    condition = req.params.id ? {
        ID: req.params.id
    } : null;


    /**
     * TODO: Add a join to include the claim request status name to the result
     */
    ClaimRequests.findAll({
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