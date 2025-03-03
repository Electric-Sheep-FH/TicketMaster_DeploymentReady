using FilRouge_TicketMaster_MVC_Core.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.General;

namespace FilRouge_TicketMaster_MVC_Core.Database
{
    public class TicketMasterDatabaseContext : Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityDbContext
    {
        public DbSet<Buy> Buys { get; set; }
        public DbSet<Call> Calls { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<EmergencyStatus> EmergencyStatuses { get; set; }
        public DbSet<Malfunction> Malfunctions { get; set; }
        public DbSet<Person> Persons { get; set; }
        public DbSet<Software> Softwares { get; set; }
        public DbSet<TechnicianStatus> TechnicianStatuses { get; set; }
        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<TicketHistory> TicketHistories { get; set; }
        public DbSet<TicketState> TicketStates { get; set; }
        public DbSet<AppUser> AppUsers { get; set; }
        public DbSet<Warranty> Warranties { get; set; }

        public TicketMasterDatabaseContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<IdentityRole>(entity =>
            {
                entity.Property(m => m.Id).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.Name).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.NormalizedName).HasColumnType("VARCHAR(100)");
            });
            builder.Entity<IdentityUser>(entity =>
            {
                entity.Property(m => m.Id).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.UserName).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.NormalizedUserName).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.Email).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.NormalizedEmail).HasColumnType("VARCHAR(100)");
            });
            builder.Entity<IdentityUserLogin<string>>(entity =>
            {
                entity.Property(m => m.LoginProvider).HasColumnType("VARCHAR(100)");
                entity.Property(m => m.ProviderKey).HasColumnType("VARCHAR(100)");
            });
            builder.Entity<IdentityUserToken<string>>(entity =>
            {
                entity.Property(m => m.LoginProvider).HasColumnType("VARCHAR(50)");
                entity.Property(m => m.Name).HasColumnType("VARCHAR(50)");
            });
        }
    }
}
