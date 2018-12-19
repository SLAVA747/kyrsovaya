using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Role
    {
        public Role()
        {
            Клиенты = new HashSet<Клиенты>();
        }

        public int IdRole { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Клиенты> Клиенты { get; set; }
    }
}
