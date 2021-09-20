const { executeHttpRequest } = require('@sap-cloud-sdk/core');

module.exports = async function(req) {

        const getTask = await executeHttpRequest(
                { 
                    destinationName: 'SCM'
                },
                {
                    method: 'get',
                    url: `/sap/c4c/odata/v1/c4codataapi/CorporateAccountCollection`,
                    params: {
                        "$filter": `AccountID eq '${req.AccountId}'`
                }
            }
        )

        let ObjectId = getTask.data.d.results[0].ObjectID;      
        
            
        const sendIdToClientLink = await executeHttpRequest(
            { 
                    destinationName: 'SCM'
            },
            {
                method: 'patch',
                url: `/sap/c4c/odata/v1/c4codataapi/CorporateAccountCollection('${ObjectId}')`,
                data: {
                    'Z_CallPlannerID_KUT': req.ID
            },
            headers: {
                'content-type': 'application/json'
            }
            },
            {
                fetchCsrfToken: true
        });             
}