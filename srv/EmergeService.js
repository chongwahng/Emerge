const syncClientLink = require('./libs/syncClientLink.js');

module.exports = function (service) {

    var { ProductSurvey } = service.entities;

    this.after('CREATE', ProductSurvey, async (req) => {
        try {
            const syncClientLinkRequest = await syncClientLink(req);
        }
        catch (error) {
            req.reject({
                message: error.message
            });
        }
    })
}