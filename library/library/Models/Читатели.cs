using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Читатели
    {
        public Читатели()
        {
            ВыдачаКниг = new HashSet<ВыдачаКниг>();
        }

        public int IdЧитателя { get; set; }
        public int? IdВидКонтакта { get; set; }
        public string КонтактныеДанные { get; set; }
        public int? IdКлиента { get; set; }

        public virtual ВидыКонтактов IdВидКонтактаNavigation { get; set; }
        public virtual Клиенты IdКлиентаNavigation { get; set; }
        public virtual ICollection<ВыдачаКниг> ВыдачаКниг { get; set; }
    }
}
