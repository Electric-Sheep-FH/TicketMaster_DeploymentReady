using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class CustomerTicketBoardViewModel
    {
        public List<TicketHistory> openTicket {  get; set; }
        public List<TicketHistory> closeTicket { get;set; }
    }
}