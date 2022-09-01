using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Inventario.DAL.DBContext;
using Microsoft.EntityFrameworkCore;

using Inventario.DAL.Interfaces;
using Inventario.DAL.Implementacion;
//using Inventario.BLL.Interfaces;
//using Inventario.BLL.Implementacion;

namespace Inventario.IOC
{
    public static class Dependencia
    {
        public static void InyectarDependencia(this IServiceCollection services, IConfiguration Configuration)
        {
            services.AddDbContext<DbContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
            });

            services.AddTransient(typeof(IRepositorioGenerico<>), typeof(RepositorioGenerico<>));
        }
    }
}
