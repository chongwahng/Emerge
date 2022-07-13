sap.ui.define(["sap/ui/core/mvc/Controller",
    'sap/base/util/UriParameters'], function (Controller, UriParameters) {
        "use strict";

        return {
            
            onPageReady: function () {
                let context = this.getExtensionAPI()._view.getBindingContext();
                let emerge = context.getObject();

                if (emerge === undefined) {
                    setTimeout(this.onPageReady, 500);
                } else {
                    setTimeout(this.fillingHash, 500, context, emerge);
                }
            },

            fillingHash: function (context, object) {
                if (!object.Customer) {

                    let hash = decodeURI(window.location.hash.split("?")[1]).replace(/%20/g, " ");

                    let Customer        = UriParameters.fromQuery(hash).get("Customer");
                    let RepresentName   = UriParameters.fromQuery(hash).get("RepresentName");
                    let RepresentTitle  = UriParameters.fromQuery(hash).get("RepresentTitle");
                    let System          = UriParameters.fromQuery(hash).get("System");

                    if (Customer && System && RepresentName && RepresentTitle) {

                        let parametrObject = {
                            "Customer"      : Customer,
                            "RepresentName" : RepresentName,
                            "RepresentTitle": RepresentTitle,
                            "System"        : System
                        };

                        for (var param in parametrObject) {
                            context.setProperty(param, parametrObject[param]);
                        }
                    }
                }
            }
        };
    });