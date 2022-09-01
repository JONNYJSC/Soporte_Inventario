using Microsoft.AspNetCore.Mvc;

namespace Inventario.Web.Controllers
{
    public class UsuarioController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
