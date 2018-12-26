using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;

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
        [DisplayName ("Загрузить обложку")]
        public string ImgSrc { get; set; }
        public string Описание { get; set; }
        public DateTime? ДатаДобавления { get; set; }
        public int? Рейтинг { get; set; }
        public int? IdАвтора { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile_add_book { get; set; }
        public virtual ICollection<Полка> Полка { get; set; }

        

    }
}
