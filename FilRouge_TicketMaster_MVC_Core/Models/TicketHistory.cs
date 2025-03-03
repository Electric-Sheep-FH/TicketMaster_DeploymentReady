using System.Net.Sockets;

namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class TicketHistory
    {
        public int Id { get; set; }
        public DateTime? StatusDate { get; set; }
        public string Observation { get; set; }

        public int TicketStateId { get; set; }
        public string UserId { get; set; }
        public int TicketId { get; set; }
    }
}