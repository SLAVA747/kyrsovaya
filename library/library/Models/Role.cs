using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Role
    {
        public Role()
        {
            Users = new HashSet<Users>();
        }

        public int IdRole { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Users> Users { get; set; }
    }
}
