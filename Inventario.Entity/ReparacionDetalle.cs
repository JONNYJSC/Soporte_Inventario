using System;
using System.Collections.Generic;

namespace Inventario.Entity
{
    public partial class ReparacionDetalle
    {
        public ReparacionDetalle()
        {
            Reparacions = new HashSet<Reparacion>();
        }

        public int IdReparacionDetalle { get; set; }
        public string? Descripcion { get; set; }
        public DateTime? FechaRegistro { get; set; }

        public virtual ICollection<Reparacion> Reparacions { get; set; }
    }
}
