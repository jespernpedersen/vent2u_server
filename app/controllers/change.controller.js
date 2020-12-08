const { change_requests } = require("../models");
const { requested_changes } = require("../models");
const db = require("../models");
const ChangeRequests = db.change_requests;
const RequestedChanges = db.requested_changes;
// const Op = db.Sequelize.Op;

exports.post = (req, res) => {
    // For every item
    req.body.forEach((item) => {
        let options = null;
        if (item.id == 0 || item.id == 6) {
            // Get matching info from option table based on string
            options = 0;
        } else {
            options = 1;
        }
        try {
            requestedChange = {
                // Needs to be auto increment from database, but won't allow null value right now
                ID: item.id,
                request_id: item.id,
                // Should be getting from options table
                option_id: options
            }
            RequestedChanges.create(requestedChange)
                // If error
            if (!item.id) throw new exception();
        } catch {
            console.log("Item ID cannot be null " + item.id);
            return;
        }
    });
}

exports.get = (req, res) => {
    console.log("Get Request Received");
    res.send("Get Request");
}