const { validator } = require("sequelize/types/lib/utils/validator-extras");
const { login } = require("../models");
const db = require("../models");
const Login = db.login;
const Op = db.Sequelize.Op;

exports.get = (req, res) => {

    condition = req.params.id ? {ID: req.params.id} : null;

    Login.findAll({ where: condition })
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

exports.loginValidation = (req, res) => {

  condition = req.params.email, req.params.password ? {ID: req.params.id} : null

  const control = new FormControl ('', validators.required);

  this.email = new FormControl('', [
    validators.required,
    validators.pattern^[a-zA-Z0-9]
  ])

  this.password = new Formcontrol ('', [
    validators.required,
    validators.maxLength(10).pattern^[a-zA-Z0-9]
  ])

}
