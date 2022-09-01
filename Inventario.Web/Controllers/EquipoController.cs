using Microsoft.AspNetCore.Mvc;

namespace Inventario.Web.Controllers
{
    public class EquipoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult HistorialEquipo()
        {
            return View();
        }

        public IActionResult ReporteEquipo()
        {
            return View();
        }
    }
}
