/**
 * This changes UnitPrice in draft record to expose it when record is applied
 * @Before(event = { "UPDATE" }, entity = "NorthwindSrv.OrderDetails.drafts")
 * @param {Object} req - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(req) {
	// Your code here
    if (req) {
        if (req.data) {
            if (req.data.product_ID) {
                const northSrv = await cds.connect.to("NorthwindSrv");
                let prod_id = req.data.product_ID
                let sqlprod = SELECT.from`Products`.where` ID=${prod_id}`
                let productstm = await northSrv.get(sqlprod)
                req.data.UnitPrice = productstm[0].UnitPrice
            }
        }
    }
}