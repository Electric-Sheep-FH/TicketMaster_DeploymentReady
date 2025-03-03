using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.Models;
using Microsoft.AspNetCore.Authentication;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using FilRouge_TicketMaster_MVC_Core.DTO;

namespace FilRouge_TicketMaster_MVC_Core.Controllers
{
    public class TestController : Controller
    {
        private readonly TicketMasterDatabaseContext _appDbContext;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<IdentityUser> _userManager;
        public TestController(TicketMasterDatabaseContext appDbContext, RoleManager<IdentityRole> roleManager, UserManager<IdentityUser> userManager)
        {
            _appDbContext = appDbContext;
            _roleManager = roleManager;
            _userManager = userManager;
        }
        public IActionResult Index()
        {
            /*CreateRoledPersonTestViewModel viewModel = new CreateRoledPersonTestViewModel();
            viewModel.Roles = _roleManager.Roles.ToList();
            return View(viewModel);*/
            var viewModel = new CreateRoledPersonTestViewModel
            {
                Person = new Person(), // Instanciation de l'objet Person
                Roles = _roleManager.Roles.ToList()
            };
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Index(CreatePersonDTO dto)
        {
            if (ModelState.IsValid)
            {
                if (dto.RoleId == "1")
                {
                    IdentityUser admin = new AppUser
                    {
                        Firstname = dto.Person.Firstname,
                        Lastname = dto.Person.Lastname,
                        BirthdayDate = dto.Person.BirthdayDate,
                        Address = dto.Person.Address,
                        City = dto.Person.City,
                        PostalCode = dto.Person.PostalCode,
                        CountryId = 1,
                        Email = dto.Person.Email,
                        PhoneNumber = dto.Person.PhoneNumber,
                        MobilePhone = dto.Person.MobilePhone,
                        UserName = dto.Person.Email,
                        PasswordHash = dto.Person.PasswordHash,
                        TechnicianStatusId = 1,
                    };
                    IdentityResult result = await _userManager.CreateAsync(admin, admin.PasswordHash);
                    if (result.Succeeded)
                    {
                        _userManager.AddToRoleAsync(admin, "Admin").Wait();
                    }
                }
                if (dto.RoleId == "4")
                {
                    IdentityUser technician = new AppUser
                    {
                        Firstname = dto.Person.Firstname,
                        Lastname = dto.Person.Lastname,
                        BirthdayDate = dto.Person.BirthdayDate,
                        Address = dto.Person.Address,
                        City = dto.Person.City,
                        PostalCode = dto.Person.PostalCode,
                        CountryId = 1,
                        Email = dto.Person.Email,
                        PhoneNumber = dto.Person.PhoneNumber,
                        MobilePhone = dto.Person.MobilePhone,
                        UserName = dto.Person.Email,
                        PasswordHash = dto.Person.PasswordHash,
                        TechnicianStatusId = 1,
                    };
                    IdentityResult result = await _userManager.CreateAsync(technician, technician.PasswordHash);
                    if (result.Succeeded)
                    {
                        _userManager.AddToRoleAsync(technician, "Technician").Wait();
                    }
                }
                if (dto.RoleId == "5")
                {
                    IdentityUser customer = new Customer
                    {
                        Firstname = dto.Person.Firstname,
                        Lastname = dto.Person.Lastname,
                        BirthdayDate = dto.Person.BirthdayDate,
                        Address = dto.Person.Address,
                        City = dto.Person.City,
                        PostalCode = dto.Person.PostalCode,
                        CountryId = 1,
                        Email = dto.Person.Email,
                        PhoneNumber = dto.Person.PhoneNumber,
                        MobilePhone = dto.Person.MobilePhone,
                        UserName = dto.Person.Email,
                        PasswordHash = dto.Person.PasswordHash,
                    };
                    IdentityResult result = await _userManager.CreateAsync(customer, customer.PasswordHash);
                    if (result.Succeeded)
                    {
                        _userManager.AddToRoleAsync(customer, "Customer").Wait();
                        return View("PersonAddedSuccessfully");
                    }
                }
                return View("PersonAddedSuccessfully");
            }
            else
            {
                // En cas d'erreur de validation, reconstruisez le modèle pour la vue
                var viewModel = new CreateRoledPersonTestViewModel
                {
                    Person = dto.Person, // ou new Person() selon vos besoins
                    Roles = _roleManager.Roles.ToList(),
                    // Vous pouvez également affecter RoleId si nécessaire
                };
                return View(viewModel);
            }
        }
        public IActionResult Modal()
        {
            return View();
        }
    }
}