namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class Call
    {
        public int Id { get; set; }
        public DateTime? StartCallDate { get; set; }
        public DateTime? AnsweringCallDate { get; set; }
        public DateTime? EndCallDate { get; set; }
        
        public string CustomerId { get; set; }
        public string UserId { get; set; }
    }
}
