using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Жанры
    {
        public Жанры()
        {
            Книги = new HashSet<Книги>();
        }

        public int IdЖанра { get; set; }
        public string НазваниеЖанра { get; set; }

        public virtual ICollection<Книги> Книги { get; set; }
    }
}
