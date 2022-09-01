using System;
using System.Collections.Generic;

namespace Inventario.Entity
{
    public partial class Reparacion
    {
        public int IdReparacion { get; set; }
        public int? IdEquipo { get; set; }
        public int? IdReparacionDetalle { get; set; }

        public virtual Equipo? IdEquipoNavigation { get; set; }
        public virtual ReparacionDetalle? IdReparacionDetalleNavigation { get; set; }
    }
}
