using Microsoft.AspNetCore.Mvc;

namespace Inventario.Web.Controllers
{
    public class EquipoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
