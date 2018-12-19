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
        public string Login { get; set; }
        public string Password { get; set; }
        public int? IdRole { get; set; }
        public int? Rate { get; set; }
        public int? Age { get; set; }
        public int? Comments { get; set; }
        public int? BooksBack { get; set; }
        public int? BooksReads { get; set; }

        public virtual Role IdRoleNavigation { get; set; }
        public virtual ICollection<Читатели> Читатели { get; set; }
    }
}
