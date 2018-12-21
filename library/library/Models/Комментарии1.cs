using System;
using System.Collections.Generic;

namespace library.Models
{
    public partial class Комментарии1
    {
        public int IdКомментария { get; set; }
        public int? IdКлиента { get; set; }
        public string Text { get; set; }
        public int? IdКниги { get; set; }

        public virtual Клиенты IdКлиентаNavigation { get; set; }
    }
}
