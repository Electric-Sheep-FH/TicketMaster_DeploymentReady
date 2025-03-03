namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class Software
    {
        public int Id { get; set; }
        public string SoftwareName { get; set; }
        public int? Version { get; set; }
        public int WarrantyId { get; set; }
    }
}
