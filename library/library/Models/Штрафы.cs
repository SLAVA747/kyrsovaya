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
        public int? IdВыдачи { get; set; }
        public int? IdСистемыШтрафов { get; set; }

        public virtual СистемаШтрафов IdСистемыШтрафовNavigation { get; set; }
        public virtual ICollection<ВыдачаКниг> ВыдачаКниг { get; set; }
    }
}
