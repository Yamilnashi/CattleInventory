using BeefData.Interfaces;
using BeefData.Models;
using BeefInventory.Models;
using Microsoft.AspNetCore.Mvc;

namespace BeefInventory.Controllers
{
    [Route("api/cattle")]
    public class CattleController : Controller
    {
        private readonly ICattleService _cattleService;

        public CattleController(ICattleService cattleService)
        {
            _cattleService = cattleService;
        }

        [HttpPost("process")]
        public async Task<IActionResult> Process([FromBody] InventoryRequest request)
        {
            // obviously we can return more detailed information like maybe a few cattle was successful and others werent.

            if (!request.CattleIds.Any() ||
                !request.Products.Any() ||
                !request.Products.ToList().TrueForAll(x => x.Quantity > 0))
            {
                return BadRequest("No cattle or products to process.");
            }

            try
            {
                foreach (int cattleId in request.CattleIds)
                {
                    CattleValidationResult validationResult = await _cattleService.IsValidated(cattleId);
                    if (!validationResult.IsValid)
                    {
                        throw new Exception(validationResult.ErrorMessage);
                    }

                    CattleProcessResult processResult = await _cattleService.ProcessCattleAsync(cattleId, request.Products);
                }

            } catch (Exception ex)
            {
                // maybe do something else, save this somewhere?
                return BadRequest(ex.Message);
            }
            return Ok();
        }
    }
}
