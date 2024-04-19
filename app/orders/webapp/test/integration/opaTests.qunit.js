sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'orders/test/integration/FirstJourney',
		'orders/test/integration/pages/OrdersList',
		'orders/test/integration/pages/OrdersObjectPage',
		'orders/test/integration/pages/OrderDetailsObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrdersList, OrdersObjectPage, OrderDetailsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('orders') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrdersList: OrdersList,
					onTheOrdersObjectPage: OrdersObjectPage,
					onTheOrderDetailsObjectPage: OrderDetailsObjectPage
                }
            },
            opaJourney.run
        );
    }
);