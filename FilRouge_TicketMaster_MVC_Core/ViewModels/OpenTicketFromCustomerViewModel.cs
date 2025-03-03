using FilRouge_TicketMaster_MVC_Core.Models;

namespace FilRouge_TicketMaster_MVC_Core.ViewModels
{
    public class OpenTicketFromCustomerViewModel
    {
        public List<Software> Softwares { get; set; }
        public List<Malfunction> Malfunction { get; set; }
        public int SoftwareId { get; set; }
        public int MalfunctionId { get; set; }
        public string Observation {  get; set; }
        public string CanalResponse { get; set; }
    }
}