using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Inventario.DAL.DBContext;
using Inventario.DAL.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Inventario.DAL.Implementacion
{
    public class RepositorioGenerico<TEntity> : IRepositorioGenerico<TEntity> where TEntity : class
    {
        private readonly dbInventarioContext _dbContext;

        public RepositorioGenerico(dbInventarioContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<TEntity> Obtener(Expression<Func<TEntity, bool>> Filtro)
        {
            try
            {
                TEntity entidad = await _dbContext.Set<TEntity>().FirstOrDefaultAsync(Filtro);
                return entidad;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<TEntity> Crear(TEntity entidad)
        {
            try
            {
                _dbContext.Set<TEntity>().Add(entidad);
                await _dbContext.SaveChangesAsync();
                return entidad;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<bool> Editar(TEntity entidad)
        {
            try
            {
                _dbContext.Update(entidad);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<bool> Eliminar(TEntity entidad)
        {
            try
            {
                _dbContext.Remove(entidad);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<IQueryable<TEntity>> Consultar(Expression<Func<TEntity, bool>>? Filtro = null)
        {
            IQueryable<TEntity> queryEntidad = Filtro == null ? _dbContext.Set<TEntity>() : _dbContext.Set<TEntity>().Where(Filtro);
            return queryEntidad;
        }

    }
}
