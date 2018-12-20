using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;

namespace library.Models
{
    public partial class Клиенты
    {
       
        public Клиенты()
        {
            Читатели = new HashSet<Читатели>();
        }
        [Key]
        public int IdКлиента { get; set; }
        public string Фамилия { get; set; }
        public string Имя { get; set; }
        public string Отчество { get; set; }
        public string Адрес { get; set; }
        public string Login { get; set; }
        
        [Required]
        public string Password { get; set; }
        public int? IdRole { get; set; }
        public int? Rate { get; set; }
        public int? Age { get; set; }
        public int? Comments { get; set; }
        public int? BooksBack { get; set; }
        public int? BooksReads { get; set; }

        public virtual Role IdRoleNavigation { get; set; }
        public virtual ICollection<Читатели> Читатели { get; set; }


        
        public string avatar { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }

    }
}
