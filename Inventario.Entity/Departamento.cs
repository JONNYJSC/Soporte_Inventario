using System;
using System.Collections.Generic;

namespace Inventario.Entity
{
    public partial class Departamento
    {
        public Departamento()
        {
            Equipos = new HashSet<Equipo>();
        }

        public int IdDepartamento { get; set; }
        public string? Descripcion { get; set; }
        public bool? EsActivo { get; set; }
        public DateTime? FechaRegistro { get; set; }

        public virtual ICollection<Equipo> Equipos { get; set; }
    }
}
