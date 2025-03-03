using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.DTO;
using FilRouge_TicketMaster_MVC_Core.Models;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Mono.TextTemplating;

namespace FilRouge_TicketMaster_MVC_Core.Controllers
{
    public class CustomerDashboardController : Controller
    {
        private readonly TicketMasterDatabaseContext _context;
        private readonly UserManager<IdentityUser> _userManager;


        public CustomerDashboardController(TicketMasterDatabaseContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index(string id)
        {
            Person person = await _context.Persons.Where(p => p.Id == id).FirstOrDefaultAsync();

            return View(person);
        }
        public IActionResult OnGoinIncident()
        {
            string userId = _userManager.GetUserId(User);
            if (userId != null)
            {
                //Faire une requête pour obtenir la liste d'id de ticket ouvert par l'utilisateur connecté
                List<int> listTicketId = _context.Tickets.Where(t => t.CustomerId == userId).Select(s => s.Id).ToList();
                
                //récupéré le dernier historique de chaque ticket
                List<TicketHistory?> latestHistories = _context.TicketHistories.Where(th => listTicketId.Contains(th.TicketId))
                    .GroupBy(th => th.TicketId)
                    .Select(g => g.OrderByDescending(th => th.StatusDate).FirstOrDefault())
                    .ToList();
                //list ticket ouvert
                List<TicketHistory?> onGoinTicket = latestHistories.Where(lh => lh.TicketStateId == 1 || lh.TicketStateId == 2).OrderByDescending(o => o.StatusDate).ToList();
                //list ticket fermé
                List<TicketHistory?> closedTicket = latestHistories.Where(lh => lh.TicketStateId == 3).OrderByDescending(o => o.TicketId).ToList();

                CustomerTicketBoardViewModel model = new CustomerTicketBoardViewModel
                {
                    openTicket = onGoinTicket,
                    closeTicket = closedTicket
                };
                
                return View(model);
            }
            return View();
        }
    }
}