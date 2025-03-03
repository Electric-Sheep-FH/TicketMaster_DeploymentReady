using FilRouge_TicketMaster_MVC_Core.Models;
using Microsoft.AspNetCore.Identity;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class CreateRoledPersonTestViewModel
    {
        public Person Person { get; set; }
        public string RoleId { get; set; }
        public List<IdentityRole> Roles { get; set; }
    }
}