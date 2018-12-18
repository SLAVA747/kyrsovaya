using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Users
    {
        public int Id { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int? IdRole { get; set; }

        public virtual Role IdRoleNavigation { get; set; }
    }
}
