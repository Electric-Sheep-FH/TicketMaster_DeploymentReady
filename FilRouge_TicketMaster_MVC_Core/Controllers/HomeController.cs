using FilRouge_TicketMaster_MVC_Core.Areas.Identity.Pages.Account;
using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.Models;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.Design;
using System.Diagnostics;

namespace FilRouge_TicketMaster_MVC_Core.Controllers
{
    public class HomeController : Controller
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly TicketMasterDatabaseContext _context;
        private readonly ILogger<LoginModel> _logger;
        private readonly UserManager<IdentityUser> _userManager;


        public IList<AuthenticationScheme> ExternalLogins { get; set; }


        public HomeController(SignInManager<IdentityUser> signInManager, ILogger<LoginModel> logger, TicketMasterDatabaseContext context, UserManager<IdentityUser> userManager)
        {
            _signInManager = signInManager;
            _logger = logger;
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                var user = await _userManager.GetUserAsync(User);
                if (user != null)
                {
                    if (await _userManager.IsInRoleAsync(user, "Customer"))
                    {
                        return RedirectToAction("Index", "CustomerDashboard", new {id = user.Id});
                    }
                    else
                    {
                        return RedirectToAction("Index", "UserDashboard", new {id = user.Id});
                    }
                }
            }
            ViewData["ShowNavbar"] = false;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(HomeLoginViewModel viewModel)
        {
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

            if (ModelState.IsValid)
            {
                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger account lockout, set lockoutOnFailure: true
                var result = await _signInManager.PasswordSignInAsync(viewModel.Mail, viewModel.Password, isPersistent: true, lockoutOnFailure: false);
                if (result.Succeeded)
                {
                    _logger.LogInformation("User logged in.");

                    var user = await _userManager.FindByEmailAsync(viewModel.Mail);

                    if (user != null)
                    {
                        if(await _userManager.IsInRoleAsync(user, "Customer"))
                        {
                            return RedirectToAction("Index", "CustomerDashboard", new { id = user.Id });
                        }
                        else
                        {
                            return RedirectToAction("Index","UserDashboard", new { id = user.Id });
                        }

                    } else
                    {
                        ViewData["ShowNavbar"] = false;
                        return View();
                    }

                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    ViewData["ShowNavbar"] = false;
                    return View();
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["ShowNavbar"] = false;
            return View();
        }
    }
}
