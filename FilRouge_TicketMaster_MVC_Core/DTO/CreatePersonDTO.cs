using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.DTO
{
    public class CreatePersonDTO
    {
        public Person Person { get; set; }
        public string RoleId { get; set; }
    }
}