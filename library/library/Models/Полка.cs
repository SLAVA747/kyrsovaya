using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Полка
    {
        public Полка()
        {
            ВыдачаКниг = new HashSet<ВыдачаКниг>();
        }

        public int IdПолки { get; set; }
        public int? IdКниги { get; set; }
        public int? IdЖанра { get; set; }
        public int? IdАвтора { get; set; }

        public virtual Авторы IdАвтораNavigation { get; set; }
        public virtual Жанры IdЖанраNavigation { get; set; }
        public virtual Книги IdКнигиNavigation { get; set; }
        public virtual ICollection<ВыдачаКниг> ВыдачаКниг { get; set; }
    }
}
