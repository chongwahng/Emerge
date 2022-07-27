const syncClientLink = require('./libs/syncClientLink.js');

module.exports = function (service) {
    const cds = require('@sap/cds')

    var { ProductSurvey } = service.entities;
    var { Changes, Airframer, Program, Component } = cds.entities;

    this.before('UPDATE', ProductSurvey, async (req) => {
        let query = SELECT.one.from(ProductSurvey).where({ ID: req.data.ID })
        let result_survey_old = await cds.run(query)

        let newChanges = []
        let oldValue = ''
        let newValue = ''

        if (req.data.Airframer_ID != result_survey_old.Airframer_ID) {
            query = SELECT.one.from(Airframer).where({ ID: req.data.Airframer_ID })
            let result_new = await cds.run(query)
            query = SELECT.one.from(Airframer).where({ ID: result_survey_old.Airframer_ID })
            let result_old = await cds.run(query)

            oldValue = ((result_old === null) ? '' : result_old.Name)
            newValue = ((result_new === null) ? '' : result_new.Name)

            newChanges.push(
                { FieldName: 'Airframer', OldValue: oldValue, NewValue: newValue, to_ProductSurvey_ID: result_survey_old.ID }
            )
        }

        if (req.data.Program_ID != result_survey_old.Program_ID) {
            query = SELECT.one.from(Program).where({ ID: req.data.Program_ID })
            let result_new = await cds.run(query)
            query = SELECT.one.from(Program).where({ ID: result_survey_old.Program_ID })
            let result_old = await cds.run(query)

            oldValue = ((result_old === null) ? '' : result_old.Name)
            newValue = ((result_new === null) ? '' : result_new.Name)

            newChanges.push(
                { FieldName: 'Program', OldValue: oldValue, NewValue: newValue, to_ProductSurvey_ID: result_survey_old.ID }
            )
        }

        if (req.data.Component_ID != result_survey_old.Component_ID) {
            query = SELECT.one.from(Component).where({ ID: req.data.Component_ID })
            let result_new = await cds.run(query)
            query = SELECT.one.from(Component).where({ ID: result_survey_old.Component_ID })
            let result_old = await cds.run(query)

            oldValue = ((result_old === null) ? '' : result_old.Name)
            newValue = ((result_new === null) ? '' : result_new.Name)

            newChanges.push(
                { FieldName: 'Component', OldValue: oldValue, NewValue: newValue, to_ProductSurvey_ID: result_survey_old.ID }
            )
        }

        if (req.data.TotalComponents != result_survey_old.TotalComponents) {
            newChanges.push(
                { FieldName: 'Number of components per aircraft', OldValue: result_survey_old.TotalComponents, NewValue: req.data.TotalComponents, to_ProductSurvey_ID: result_survey_old.ID }
            )
        }

        if (req.data.BusinessShare != result_survey_old.BusinessShare) {
            newChanges.push(
                { FieldName: 'Customer share in this component (%)', OldValue: result_survey_old.BusinessShare, NewValue: req.data.BusinessShare, to_ProductSurvey_ID: result_survey_old.ID }
            )
        }

        if (newChanges.length != 0) {
            query = INSERT.into(Changes).entries(newChanges)
            await cds.run(query)
        }
    })

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