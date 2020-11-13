const { presets } = require("../models");
const db = require("../models");
const Presets = db.presets;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    condition = req.params.id ? {ID: req.params.id} : null;

    Presets.findAll({ where: condition })
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

exports.getFromUser = (req, res) => {

    if(!req.params.id){
      res.status(412).send({
        message: "An user id is required"
      });
    }

    Presets.findAll({ where:  {user_id: req.params.id} })
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