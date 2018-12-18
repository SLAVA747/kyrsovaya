using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class ВыдачаКниг
    {
        public int IdВыдачи { get; set; }
        public int? IdПолки { get; set; }
        public int? IdЧитателя { get; set; }
        public DateTime? ДатаВыдачи { get; set; }
        public DateTime? ОжидаемаяДатаВозврата { get; set; }
        public DateTime? ФактическаяДатаВозврата { get; set; }
        public int? IdШтрафа { get; set; }

        public virtual Полка IdПолкиNavigation { get; set; }
        public virtual Читатели IdЧитателяNavigation { get; set; }
        public virtual Штрафы IdШтрафаNavigation { get; set; }
    }
}
