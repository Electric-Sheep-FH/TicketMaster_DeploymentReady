namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class Buy
    {
        public int Id { get; set; }
        public DateTime? BuyingDate { get; set; }

        public string CustomerId{ get; set; }
        public int SoftwareId { get; set; }
    }
}
