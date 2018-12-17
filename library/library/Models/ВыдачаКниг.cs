using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class ВыдачаКниг
    {
        public int IdВыдачи { get; set; }
        public int? IdКниги { get; set; }
        public int? IdЧитателя { get; set; }
        public DateTime? ДатаВыдачи { get; set; }
        public DateTime? ОжидаемаяДатаВозврата { get; set; }
        public DateTime? ФактическаяДатаВозврата { get; set; }
        public decimal? СуммаШтрафов { get; set; }
        public int? IdШтрафа { get; set; }

        public virtual Книги IdКнигиNavigation { get; set; }
        public virtual Читатели IdЧитателяNavigation { get; set; }
        public virtual Штрафы IdШтрафаNavigation { get; set; }
    }
}
