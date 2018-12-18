using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Авторы
    {
        public Авторы()
        {
            Полка = new HashSet<Полка>();
        }

        public int IdАвтора { get; set; }
        public string Фио { get; set; }

        public virtual ICollection<Полка> Полка { get; set; }
    }
}
