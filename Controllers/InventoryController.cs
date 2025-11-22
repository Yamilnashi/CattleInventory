using Microsoft.AspNetCore.Mvc;

namespace BeefInventory.Controllers
{
    public class InventoryController : Controller
    {
        


        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
    }
}
