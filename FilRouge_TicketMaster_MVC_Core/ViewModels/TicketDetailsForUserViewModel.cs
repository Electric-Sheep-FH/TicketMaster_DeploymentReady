using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class TicketDetailsForUserViewModel
    {
        public List<TicketHistory> TicketHistories { get; set; }
        public Person Person { get; set; }
        public string Observation { get; set; }
        public int IdTicket { get; set; }
        public List<TicketState> States { get; set; }
        public int TicketStateId { get; set; }
        public List<EmergencyStatus> EmergencyStatuses { get; set; }
        public int EmergencyStatusId { get; set; }
        public List<Malfunction> Malfunctions { get; set; }
        public int MalfunctionId { get; set; }
    }
}
