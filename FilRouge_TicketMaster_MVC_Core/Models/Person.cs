using Microsoft.AspNetCore.Identity;
using System.Data;

namespace FilRouge_TicketMaster_MVC_Core.Models
{
    public class Person : IdentityUser
    {
        public string Lastname { get; set; }
        public string Firstname { get; set; }
        public DateTime? BirthdayDate { get; set; }
        public string Address { get; set; }
        public string PostalCode { get; set; }
        public string City { get; set; }
        public string MobilePhone { get; set; }
        public int CountryId { get; set; }
    }
}
