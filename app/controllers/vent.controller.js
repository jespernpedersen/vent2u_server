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

exports.getFromRoom = (req, res) => {
    const Sequelize = require("sequelize");
    const sequelize = new Sequelize('vent2u', 'manager', ']SgtSF~BG)8WN^%p', {
        host: "localhost",
        dialect: "mysql",
        port: 3306,
        syncOnAssociation: false
    });

    let query;
    
    if(req.headers.user_role <= 1 || req.headers.user_role == undefined) {
        query = `SELECT vents.ID, (SELECT CASE WHEN vents.user_id IS NOT NULL THEN 1 ELSE 0 END) as isClaimed, vents.vent_group_id 
        FROM vents 
        LEFT JOIN ventgroups 
        ON vents.vent_group_id = ventgroups.ID 
        WHERE ventgroups.room_id = ?`;
    } else {
        query = `SELECT vents.ID, vents.user_id, vents.vent_group_id 
        FROM vents 
        LEFT JOIN ventgroups 
        ON vents.vent_group_id = ventgroups.ID 
        WHERE ventgroups.room_id = ?`;
    }

    sequelize.query(query, {
        replacements: [req.params.id],
        type: sequelize.QueryTypes.SELECT
      }).then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
            message: "Error updating Vent with id=" + id
        });
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