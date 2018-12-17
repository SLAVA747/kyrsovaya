using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Книги
    {
        public Книги()
        {
            ВыдачаКниг = new HashSet<ВыдачаКниг>();
        }

        public int IdКниги { get; set; }
        public string НазваниеКниги { get; set; }
        public string Автор { get; set; }
        public int? IdЖанра { get; set; }

        public virtual Жанры IdЖанраNavigation { get; set; }
        public virtual ICollection<ВыдачаКниг> ВыдачаКниг { get; set; }
    }
}
