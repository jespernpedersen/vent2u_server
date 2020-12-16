const db = require("../models");

exports.post = (req, res) => {
    RequestGroup = {
        user_id: 1,
        vent_id: 1,
        status_id: 0
    }
    ChangeRequests.create(RequestGroup, { isNewRecord: true }).then(function(err, result) {
            if (err) {
                console.log(err);
                // callback(0);
            } else {
                callback(result.id); // This is generated primary key
                req.body.forEach((item) => {
                    console.log(item);
                })
            }
        })
        /*
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
        */
}

exports.get = (req, res) => {
    console.log("Get Request Received");
    res.send("Get Request");
}