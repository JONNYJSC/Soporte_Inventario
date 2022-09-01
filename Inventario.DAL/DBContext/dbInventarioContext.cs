using System;
using System.Collections.Generic;
using Inventario.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Inventario.DAL.DBContext
{
    public partial class dbInventarioContext : DbContext
    {
        public dbInventarioContext()
        {
        }

        public dbInventarioContext(DbContextOptions<dbInventarioContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Configuracion> Configuracions { get; set; } = null!;
        public virtual DbSet<Departamento> Departamentos { get; set; } = null!;
        public virtual DbSet<Equipo> Equipos { get; set; } = null!;
        public virtual DbSet<Menu> Menus { get; set; } = null!;
        public virtual DbSet<Reparacion> Reparacions { get; set; } = null!;
        public virtual DbSet<ReparacionDetalle> ReparacionDetalles { get; set; } = null!;
        public virtual DbSet<Rol> Rols { get; set; } = null!;
        public virtual DbSet<RolMenu> RolMenus { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;
        public virtual DbSet<Dato> Datos { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Configuracion>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Configuracion");

                entity.Property(e => e.Propiedad)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Recurso)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Valor)
                    .HasMaxLength(60)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Departamento>(entity =>
            {
                entity.HasKey(e => e.IdDepartamento)
                    .HasName("PK__Departam__787A433DCD8C2538");

                entity.ToTable("Departamento");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Equipo>(entity =>
            {
                entity.HasKey(e => e.IdEquipo)
                    .HasName("PK__Equipo__D8052408374F7B98");

                entity.ToTable("Equipo");

                entity.Property(e => e.CodigoInventario)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("codigoInventario");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(1000)
                    .IsUnicode(false);

                entity.Property(e => e.DireccionIp)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Direccion_IP");

                entity.Property(e => e.Equipo1)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Equipo");

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Marca)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Modelo)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Equipos)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("FK__Equipo__IdDepart__72C60C4A");
            });

            modelBuilder.Entity<Menu>(entity =>
            {
                entity.HasKey(e => e.IdMenu)
                    .HasName("PK__Menu__C26AF483538873D7");

                entity.ToTable("Menu");

                entity.Property(e => e.IdMenu).HasColumnName("idMenu");

                entity.Property(e => e.Controlador)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Icono)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PaginaAccion)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdMenuPadreNavigation)
                    .WithMany(p => p.InverseIdMenuPadreNavigation)
                    .HasForeignKey(d => d.IdMenuPadre)
                    .HasConstraintName("FK__Menu__IdMenuPadr__5CD6CB2B");
            });

            modelBuilder.Entity<Reparacion>(entity =>
            {
                entity.HasKey(e => e.IdReparacion)
                    .HasName("PK__Reparaci__DCF37F00BCEC13A3");

                entity.ToTable("Reparacion");

                entity.HasOne(d => d.IdEquipoNavigation)
                    .WithMany(p => p.Reparacions)
                    .HasForeignKey(d => d.IdEquipo)
                    .HasConstraintName("FK__Reparacio__IdEqu__7A672E12");

                entity.HasOne(d => d.IdReparacionDetalleNavigation)
                    .WithMany(p => p.Reparacions)
                    .HasForeignKey(d => d.IdReparacionDetalle)
                    .HasConstraintName("FK__Reparacio__IdRep__7B5B524B");
            });

            modelBuilder.Entity<ReparacionDetalle>(entity =>
            {
                entity.HasKey(e => e.IdReparacionDetalle)
                    .HasName("PK__Reparaci__02781E3B73B69B14");

                entity.ToTable("ReparacionDetalle");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(2500)
                    .IsUnicode(false);

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Rol>(entity =>
            {
                entity.HasKey(e => e.IdRol)
                    .HasName("PK__Rol__2A49584C17336CF8");

                entity.ToTable("Rol");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<RolMenu>(entity =>
            {
                entity.HasKey(e => e.IdRolMenu)
                    .HasName("PK__RolMenu__79F10105F83A609B");

                entity.ToTable("RolMenu");

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdMenuNavigation)
                    .WithMany(p => p.RolMenus)
                    .HasForeignKey(d => d.IdMenu)
                    .HasConstraintName("FK__RolMenu__IdMenu__6477ECF3");

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.RolMenus)
                    .HasForeignKey(d => d.IdRol)
                    .HasConstraintName("FK__RolMenu__IdRol__6383C8BA");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario)
                    .HasName("PK__Usuario__5B65BF975D800CE7");

                entity.ToTable("Usuario");

                entity.Property(e => e.Clave)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Correo)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaRegistro)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NombreFoto)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UrlFoto)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdRol)
                    .HasConstraintName("FK__Usuario__IdRol__68487DD7");
            });

            modelBuilder.Entity<Dato>(entity =>
            {
                entity.HasKey(e => e.IdDato)
                    .HasName("[PK__Datos__F298CC9F2DC9A447]");

                entity.ToTable("Dato");

                entity.Property(e => e.UrlLogo)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.NombreLogo)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Correo)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Direccion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
