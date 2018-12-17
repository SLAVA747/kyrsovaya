using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Штрафы
    {
        public Штрафы()
        {
            ВыдачаКниг = new HashSet<ВыдачаКниг>();
        }

        public int IdШтрафа { get; set; }
        public string ОписаниеШтрафа { get; set; }
        public decimal? ШтрафнаяСумма { get; set; }

        public virtual ICollection<ВыдачаКниг> ВыдачаКниг { get; set; }
    }
}
