/**
 * 
 * @On(event = { "Action1" }, entity = "NorthwindSrv.Orders")
 * @param {Object} req - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(req) {
    const tx = cds.transaction(req);
    const orderID = req._params[0].ID; // req.data.ID;
    const orderDetails = await tx.run(
        SELECT
            .from('NorthwindSrv.OrderDetails')
            .where({ order_ID: orderID })
    );

    let totalCost = 0;
    for (const detail of orderDetails) {
        totalCost += detail.cost;
    }

    req.info(`The total cost of order ${orderID} is ${totalCost}`);
}