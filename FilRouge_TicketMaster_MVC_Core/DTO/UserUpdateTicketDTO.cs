namespace FilRouge_TicketMaster_MVC_Core.DTO
{
    public class UserUpdateTicketDTO
    {
        public int IdTicket { get; set; }
        public string? Observation { get; set; }
        public int TicketStateId { get; set; }
        public int EmergencyStatusId { get; set; }
        public int MalfunctionId { get; set; }
    }
}
