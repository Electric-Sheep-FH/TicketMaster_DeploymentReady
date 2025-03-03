using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.Models;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace FilRouge_TicketMaster_MVC_Core.Controllers
{
    public class CustomerOpenTicket : Controller
    {
        private readonly TicketMasterDatabaseContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public CustomerOpenTicket(TicketMasterDatabaseContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public IActionResult Index()
        {
            OpenTicketFromCustomerViewModel viewModel = new OpenTicketFromCustomerViewModel();
            viewModel.Softwares = _context.Softwares.ToList();
            viewModel.Malfunction = _context.Malfunctions.ToList();

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Index(OpenTicketFromCustomerViewModel viewmodel)
        {
            IdentityUser user = await _userManager.GetUserAsync(User);
            if (user != null)
            {
                string userId = await _userManager.GetUserIdAsync(user);
                if (ModelState.IsValid)
                {
                    Ticket ticket = new Ticket
                    {
                        CustomerId = userId,
                        EmergencyStatusId = 5,
                        MalfunctionId = viewmodel.MalfunctionId,
                    };

                    _context.Tickets.Add(ticket);
                    _context.SaveChanges();

                    TicketHistory ticketHistory = new TicketHistory
                    {
                        TicketId = ticket.Id,
                        Observation = "Transfer to tech",
                        StatusDate = DateTime.Now,
                        TicketStateId = 1,
                        UserId = "ec20024e-f81c-4b38-b326-0a558a5e72e7",
                    };

                    _context.TicketHistories.Add(ticketHistory);
                    _context.SaveChanges();

                     ticketHistory = new TicketHistory
                    {
                        TicketId = ticket.Id,
                        Observation = viewmodel.Observation,
                        StatusDate = DateTime.Now,
                        TicketStateId = 1,
                        UserId = userId,
                    };

                    _context.TicketHistories.Add(ticketHistory);
                    _context.SaveChanges();

                    return RedirectToAction("Index", "CustomerDashboard", new { id = userId});
                }
            }
            return View(viewmodel);
        }
    }
}