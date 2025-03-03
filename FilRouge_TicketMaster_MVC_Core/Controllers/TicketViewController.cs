using FilRouge_TicketMaster_MVC_Core.Database;
using FilRouge_TicketMaster_MVC_Core.DTO;
using FilRouge_TicketMaster_MVC_Core.Models;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace FilRouge_TicketMaster_MVC_Core.Controllers
{
    public class TicketViewController : Controller
    {
        private readonly TicketMasterDatabaseContext _context;
        private readonly UserManager<IdentityUser> _userManager;


        public TicketViewController(TicketMasterDatabaseContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public IActionResult TicketDetailsForUser(int id)
        {
            List<TicketHistory?> th = _context.TicketHistories.Where(th => th.TicketId == id).OrderByDescending(th => th.StatusDate).ToList();
            
            int emergencyId = _context.Tickets.Where(t => t.Id == id).Select(s => s.EmergencyStatusId).FirstOrDefault();
            int malfunctionId = _context.Tickets.Where(t => t.Id == id).Select(s => s.MalfunctionId).FirstOrDefault();
            int lastStateId = _context.TicketHistories.Where(th => th.TicketId == id).OrderByDescending(o => o.StatusDate).Select(s => s.TicketStateId).FirstOrDefault();

            string customerId = _context.Tickets.Where(t => t.Id == id).Select(s => s.CustomerId).FirstOrDefault();
            Person person = _context.Persons.Where(p => p.Id == customerId).FirstOrDefault();

            TicketDetailsForUserViewModel viewModel = new TicketDetailsForUserViewModel
            {
                EmergencyStatuses = _context.EmergencyStatuses.ToList(),
                EmergencyStatusId = emergencyId,
                IdTicket = id,
                Malfunctions = _context.Malfunctions.ToList(),
                MalfunctionId = malfunctionId,
                Person = person,
                States = _context.TicketStates.ToList(),
                TicketStateId = lastStateId,
                TicketHistories = th,
            };

            return View("TicketUserView",viewModel);
        }
        [HttpPost]
        public async Task<IActionResult> TicketDetailsForUser(UserUpdateTicketDTO dto)
        {
            if (ModelState.IsValid)
            {
                Ticket ticket = _context.Tickets.Where(p => p.Id == dto.IdTicket).FirstOrDefault();
                TicketHistory lastTH = _context.TicketHistories.Where(p => p.TicketId == dto.IdTicket).OrderByDescending(ob => ob.StatusDate).FirstOrDefault();


                if (ticket.EmergencyStatusId != dto.EmergencyStatusId && dto.EmergencyStatusId != null)
                {
                    string message = "***SYS-notif*** Modified EmergencyStatusId from " + ticket.EmergencyStatusId + " to " + dto.EmergencyStatusId;

                    TicketHistory esModified = new TicketHistory
                    {
                        TicketId = dto.IdTicket,
                        TicketStateId = dto.TicketStateId,
                        StatusDate = DateTime.Now,
                        UserId = _userManager.GetUserId(User),
                        Observation = message,
                    };

                    ticket.EmergencyStatusId = dto.EmergencyStatusId;

                    _context.TicketHistories.Add(esModified);
                }

                if (ticket.MalfunctionId != dto.MalfunctionId && dto.MalfunctionId != null)
                {
                    string message = "***SYS-notif*** Modified MafunctionId from " + ticket.MalfunctionId + " to " + dto.MalfunctionId;

                    TicketHistory malfunctionModified = new TicketHistory
                    {
                        TicketId = dto.IdTicket,
                        TicketStateId = dto.TicketStateId,
                        StatusDate = DateTime.Now,
                        UserId = _userManager.GetUserId(User),
                        Observation = message,
                    };

                    ticket.MalfunctionId = dto.MalfunctionId;
                    _context.TicketHistories.Add(malfunctionModified);
                }

                if (lastTH.TicketStateId != dto.TicketStateId && dto.TicketStateId != null)
                {
                    string message = "***SYS-notif*** Modified StateId from " + lastTH.TicketStateId + " to " + dto.TicketStateId;

                    TicketHistory stateModified = new TicketHistory
                    {
                        TicketId = dto.IdTicket,
                        TicketStateId = dto.TicketStateId,
                        StatusDate = DateTime.Now,
                        UserId = _userManager.GetUserId(User),
                        Observation = message,
                    };


                    _context.TicketHistories.Add(stateModified);
                }

                if(dto.Observation != null)
                {
                    TicketHistory th = new TicketHistory
                    {
                        TicketId = dto.IdTicket,
                        TicketStateId = dto.TicketStateId,
                        StatusDate = DateTime.Now,
                        UserId = _userManager.GetUserId(User),
                        Observation = dto.Observation,
                    };
                    _context.TicketHistories.Add(th);
                }

                await _context.SaveChangesAsync();

                if (User.IsInRole("Customer"))
                    return RedirectToAction("TicketCustomerView", new { id = dto.IdTicket });
                else
                    return RedirectToAction("TicketDetailsForUser", new { id = dto.IdTicket });
            }
            return View(dto);
        }
        public IActionResult TicketDetails(int id)
        {
            List<TicketHistory?> th = _context.TicketHistories.Where(th => th.TicketId == id).OrderByDescending(th => th.StatusDate).ToList();

            DetailsCustomerTicketViewModel model = new DetailsCustomerTicketViewModel
            {
                TicketHistory = th,
                IdTicket = id
            };

            Ticket ticket = _context.Tickets.FirstOrDefault(t => t.Id == id);

            string customerId = ticket.CustomerId;

            Person person = _context.Persons.Where(p => p.Id == customerId).FirstOrDefault();

            model.Person = person;
            if(th.FirstOrDefault().TicketStateId == 3)
            {
                return View("TicketClosedView", model);
            }
            if (User.IsInRole("Customer"))
                return View("TicketCustomerView", model);
            else
                return View("TicketUserView", model);
        }
        [HttpPost]
        public async Task<IActionResult> TicketDetails(CustomerNewObservationDTO dto)
        {
            if (ModelState.IsValid)
            {
                TicketHistory th = new TicketHistory
                {
                    TicketId = dto.IdTicket,
                    TicketStateId = 1,
                    StatusDate = DateTime.Now,
                    UserId = _userManager.GetUserId(User),
                    Observation = dto.Observation,
                };

                _context.TicketHistories.Add(th);
                await _context.SaveChangesAsync();

                if (User.IsInRole("Customer"))
                    return RedirectToAction("TicketDetails", new { id = dto.IdTicket});
                else
                    return RedirectToAction("TicketDetails", new { id = dto.IdTicket });
            }
            return View(dto);
        }
        [HttpPost]
        public async Task<IActionResult> CloseTicket(CustomerClosingTicketDTO dto)
        {
            string userId = _userManager.GetUserId(User);

            if (ModelState.IsValid)
            {
                TicketHistory th = new TicketHistory
                {
                    TicketId = dto.IdTicket,
                    TicketStateId = 3,
                    StatusDate = DateTime.Now,
                    UserId = userId,
                    Observation = "***Ticket closed by customer action***",
                };

                _context.TicketHistories.Add(th);
                await _context.SaveChangesAsync();

                if (User.IsInRole("Customer"))
                    return RedirectToAction("Index", "CustomerDashboard", new {id = userId});
                else
                    return RedirectToAction("Index", "UserDashboard", new { id = userId });
            }
            return View(dto);
        }
    }
}