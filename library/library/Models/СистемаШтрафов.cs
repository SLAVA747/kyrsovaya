using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class СистемаШтрафов
    {
        public СистемаШтрафов()
        {
            Штрафы = new HashSet<Штрафы>();
        }

        public int IdСистемыШтрафов { get; set; }
        public string ОписаниеПовреждений { get; set; }
        public decimal? ШтрафнаяСумма { get; set; }

        public virtual ICollection<Штрафы> Штрафы { get; set; }
    }
}
