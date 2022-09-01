using System;
using System.Collections.Generic;

namespace Inventario.Entity
{
    public partial class Equipo
    {
        public Equipo()
        {
            Reparacions = new HashSet<Reparacion>();
        }

        public int IdEquipo { get; set; }
        public int? IdDepartamento { get; set; }
        public string? CodigoInventario { get; set; }
        public string? Equipo1 { get; set; }
        public string? Marca { get; set; }
        public string? Descripcion { get; set; }
        public string? Modelo { get; set; }
        public string? DireccionIp { get; set; }
        public bool? EsEstado { get; set; }
        public bool? EsGarantia { get; set; }
        public DateTime? FechaRegistro { get; set; }

        public virtual Departamento? IdDepartamentoNavigation { get; set; }
        public virtual ICollection<Reparacion> Reparacions { get; set; }
    }
}
