using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class HistoryTicketFromCustomerViewModel
    {
        Ticket Ticket { get; set; }
        TicketHistory TicketHistory { get; set; }
    }
}