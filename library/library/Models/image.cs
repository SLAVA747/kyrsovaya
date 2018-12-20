    using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace library.Models
{
    public partial class image

    {
        public int ImageID { get; set; }
        public String Title { get; set; }
        [DisplayName("ua")]
        public String ImagePath { get; set; }
     



    }
}