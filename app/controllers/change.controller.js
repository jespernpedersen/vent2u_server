const { Change } = require("../models");
const db = require("../models");
// const Change = db.change;
// const Op = db.Sequelize.Op;

exports.post = (req, res) => {
    // console.log("Post Request Received");
    // res.send("Post Request Received");
    console.log(req.body);
}

exports.get = (req, res) => {
    console.log("Get Request Received");
    res.send("Get Request");
}