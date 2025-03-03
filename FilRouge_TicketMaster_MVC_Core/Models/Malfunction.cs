using System.Net.Sockets;

namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class Malfunction
    {
        public int Id { get; set; }
        public string CategoryName { get; set; }
        public int SoftwareId { get; set; }
    }
}
