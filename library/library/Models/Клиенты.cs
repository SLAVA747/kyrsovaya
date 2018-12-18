using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Клиенты
    {
        public Клиенты()
        {
            Читатели = new HashSet<Читатели>();
        }

        public int IdКлиента { get; set; }
        public string Фамилия { get; set; }
        public string Имя { get; set; }
        public string Отчество { get; set; }
        public string Адрес { get; set; }

        public virtual ICollection<Читатели> Читатели { get; set; }
    }
}
