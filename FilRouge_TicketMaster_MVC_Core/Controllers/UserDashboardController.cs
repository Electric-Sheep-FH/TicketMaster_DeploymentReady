using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace FilRouge_TicketMaster_MVC_Core.Controllers
{
    [Authorize(Roles = "Admin, Director, Manager, Technician")]
    public class UserDashboardController : Controller
    {
        private readonly TicketMasterDatabaseContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public UserDashboardController(TicketMasterDatabaseContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index(string id)
        {
            UserDashboardViewModel model = new UserDashboardViewModel();

            //récupération liste ID ticket correspondant à l'ID de l'user et dont le dernier historique ticket n'est pas égale à 3 (clôturé)
            var ticketIds = await _context.TicketHistories
                .Where(th => th.UserId == id)
                .GroupBy(th => th.TicketId)
                .Where(g => g.OrderByDescending(th => th.StatusDate)
                    .FirstOrDefault().TicketStateId != 3)
                .Select(g => g.Key)
                .Distinct()
                .ToListAsync();

            model.TicketId = ticketIds;


            var ticketCustomerNames = await _context.Tickets
                .Where(t => ticketIds.Contains(t.Id))
                .Join(_context.Customers,
                    t => t.CustomerId,
                    c => c.Id,
                    (t, c) => new { t.Id, CustomerName = c.Lastname })
                .ToListAsync();
            model.TicketCustomerName = ticketCustomerNames.GroupBy(tc => tc.Id)
                .ToDictionary(g => g.Key, g => g.First().CustomerName);

            //recherche 
            var lastTicketHistories = await _context.TicketHistories
                .Where(th => ticketIds.Contains(th.TicketId))
                .GroupBy(th => th.TicketId)
                .Select(g => g.OrderByDescending(th => th.StatusDate)
                  .Where(th => !th.Observation.StartsWith("***SYS-notif***"))
                  .FirstOrDefault() ?? g.OrderByDescending(th => th.StatusDate).FirstOrDefault())
                .ToListAsync();

            model.lastTickets = lastTicketHistories.Where(th => th.TicketStateId != 3).OrderBy(th => th.StatusDate).ToList();

            return View(model);
        }
    }
}