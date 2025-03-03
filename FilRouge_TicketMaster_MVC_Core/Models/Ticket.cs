namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class Ticket
    {
        public int Id { get; set; }

        public string CustomerId { get; set; }
        public int MalfunctionId { get; set; }
        public int EmergencyStatusId { get; set; }
    }
}