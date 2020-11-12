const db = require("../models");
const Rooms = db.rooms;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    condition = req.params.id ? {ID: req.params.id} : null;

    Rooms.findAll({ where: condition })
    .then( data => {
        res.send(data);
    })
    .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving tutorials."
        });
      });
}