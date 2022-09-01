using Microsoft.AspNetCore.Mvc;

namespace Inventario.Web.Controllers
{
    public class DatoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
