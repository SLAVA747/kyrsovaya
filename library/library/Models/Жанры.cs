using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Жанры
    {
        public Жанры()
        {
            Полка = new HashSet<Полка>();
        }

        public int IdЖанра { get; set; }
        public string НазваниеЖанра { get; set; }

        public virtual ICollection<Полка> Полка { get; set; }
    }
}
