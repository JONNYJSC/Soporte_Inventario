using Microsoft.AspNetCore.Mvc;

namespace Inventario.Web.Controllers
{
    public class DashBoardController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
