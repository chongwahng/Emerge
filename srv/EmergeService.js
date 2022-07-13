const syncClientLink = require('./libs/syncClientLink.js');

module.exports = function (service) {

    var { ProductSurvey } = service.entities;

    this.after('CREATE', ProductSurvey, async (req) => {
        try {
//            const syncClientLinkRequest = await syncClientLink(req, request);  sprint 1 - does not require integration to C4C yet
        }
        catch (error) {
            request.reject({
                message: error.message
            });
        }
    })
}