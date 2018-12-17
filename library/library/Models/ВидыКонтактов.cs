using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class ВидыКонтактов
    {
        public ВидыКонтактов()
        {
            Читатели = new HashSet<Читатели>();
        }

        public int IdВидКонтакта { get; set; }
        public string Наименование { get; set; }

        public virtual ICollection<Читатели> Читатели { get; set; }
    }
}
