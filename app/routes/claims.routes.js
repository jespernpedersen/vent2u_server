module.exports = app => {

    const settings = require("../shared/constants");

    const router = require("express").Router();

    const claimRequests = require("../controllers/claim.controller");

    router.get('/', claimRequests.get);
    router.get('/:id', claimRequests.get);

    router.post('/', claimRequests.create);//create new claimrequest
    router.put('/', claimRequests.update);//change request status

    app.use(settings.PATH + '/claims', router);
}