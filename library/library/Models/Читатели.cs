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
        public string Фамилия { get; set; }
        public string Имя { get; set; }
        public string Отчество { get; set; }
        public string Адрес { get; set; }
        public string Телефон { get; set; }

        public virtual ICollection<ВыдачаКниг> ВыдачаКниг { get; set; }
    }
}
