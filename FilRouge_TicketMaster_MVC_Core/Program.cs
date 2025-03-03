using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;

namespace FilRouge_TicketMaster_MVC_Core
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            builder.Services.AddScoped<TicketMasterDatabaseContext>();

            var connectionString = builder.Configuration.GetConnectionString("WebAppDbContextConnection") ?? throw new InvalidOperationException("Connection string'WebAppDbContextConnection' not found.");
            
            builder.Services.AddDbContext<TicketMasterDatabaseContext>(options => options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));

            //$added automatically after identity migration
            builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = false)
                            .AddRoles<IdentityRole>()
                            .AddEntityFrameworkStores<TicketMasterDatabaseContext>();


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            //$added from th�o tuto
            app.MapRazorPages();

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
