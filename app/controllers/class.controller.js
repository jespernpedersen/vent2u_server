const db = require("../models");
const Classes = db.classes;

exports.get = (req, res) => {

    condition = req.params.id ? {ID: req.params.id} : null;

    Classes.findAll({ where: condition })
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

exports.getFromRoom = (req, res) => {
  
  condition = Req.params.id ? {room_id: req.params.id} : null 

  Classes.findAll({ where: condition })
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