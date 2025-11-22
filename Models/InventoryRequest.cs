using BeefData.Models;

namespace BeefInventory.Models
{
    public class InventoryRequest
    {
        public int[] CattleIds { get; set; } = [];
        public Product[] Products { get; set; } = [];
    }
}
