using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class UserDashboardViewModel
    {
        public List<int> TicketId { get; set; }
        public List<TicketHistory> lastTickets {  get; set; }
        //public List<DateTime?>? DateTicket { get; set; }
        public Dictionary<int,string> TicketCustomerName { get; set; }
    }
}