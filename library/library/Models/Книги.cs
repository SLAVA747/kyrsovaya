using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Книги
    {
        public Книги()
        {
            Полка = new HashSet<Полка>();
        }

        public int IdКниги { get; set; }
        public string НазваниеКниги { get; set; }
        public string ImgSrc { get; set; }
        public string Описание { get; set; }
        public DateTime? ДатаДобавления { get; set; }
        public int? Рейтинг { get; set; }
        public int? IdАвтора { get; set; }

        public virtual ICollection<Полка> Полка { get; set; }
    }
}
