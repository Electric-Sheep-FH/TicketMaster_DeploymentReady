using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class DetailsCustomerTicketViewModel
    {
        public List<TicketHistory> TicketHistory { get; set; }
        public Person Person { get; set; }
        public string Observation {  get; set; }
        public int IdTicket {  get; set; }
    }
}