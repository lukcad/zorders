/**
 * This initiate default value of Discount to avoid null for new records
 * @Before(event = { "CREATE" }, entity = "NorthwindSrv.OrderDetails.drafts")
 * @param {Object} req - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function (req) {
    // Your code here
    if (!req.data.Discount) {
        req.data.Discount = 0
      }
}