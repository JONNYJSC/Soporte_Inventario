using Microsoft.AspNetCore.Mvc;

namespace Inventario.Web.Controllers
{
    public class DepartamentoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
