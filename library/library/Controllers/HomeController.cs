using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using library.Models;

namespace library.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {


            return View();
        }
        [HttpGet]
        public JsonResult Index2()
        {
            library_globalContext db = new library_globalContext();
            /* var num_info = (from a in db.Numbers
                             join b in db.Company on a.CompanyId equals b.CompanyId
                             select new
                             {
                                 bla1 = b.CompanyName
                             }).ToList();*/
            var num_info = (from a in db.Полка
                            join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                            join c in db.Жанры on a.IdЖанра equals c.IdЖанра
                            join d in db.Книги on a.IdКниги equals d.IdКниги
                            select new
                            {
                                Id_полки = a.IdПолки,
                                Название_книги = d.НазваниеКниги,
                                ФИО_Автора = b.Фио,
                                Жанр = c.НазваниеЖанра
                            }).ToList();
            return Json(num_info, JsonRequestBehavior.AllowGet);
        }
    }
}
