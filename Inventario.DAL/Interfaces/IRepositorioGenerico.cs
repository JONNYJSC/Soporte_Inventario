using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Linq.Expressions;

namespace Inventario.DAL.Interfaces
{
    //Clase generica para CRUD
    public interface IRepositorioGenerico<TEntity> where TEntity : class
    {
        Task<TEntity> Obtener(Expression<Func<TEntity, bool>> Filtro);
        Task<TEntity> Crear(TEntity entidad);
        Task<bool> Editar(TEntity entidad);
        Task<bool> Eliminar(TEntity entidad);
        Task<IQueryable<TEntity>> Consultar(Expression<Func<TEntity, bool>>? Filtro = null);
    }
}
