using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Profile;

namespace library.Models
{
    public class ProfileModel
    {
        [DisplayName("Пользователь")]
        public string UserName { get; set; }

        [DataType(DataType.EmailAddress)]
        [DisplayName("Email")]
        public string Email { get; set; }

        public ProfileBase ProfileInfo { get; set; }
    }

}