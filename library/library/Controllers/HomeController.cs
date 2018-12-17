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
        public ActionResult readers()
        {


            return View();
        }
        [HttpGet]
        public JsonResult Index_library()
        {
            library_globalContext db = new library_globalContext();
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
        [HttpGet]
        public JsonResult Index_readers()
        {
            library_globalContext db = new library_globalContext();
            var num_info = (from a in db.Читатели
                            join b in db.Клиенты on a.IdКлиента equals b.IdКлиента
                            join c in db.ВидыКонтактов on a.IdВидКонтакта equals c.IdВидКонтакта
                            select new
                            {
                                Id_читателя = a.IdЧитателя,
                                Фамилия = b.Фамилия,
                                Имя = b.Имя,
                                Отчество = b.Отчество,
                                Вид_контакта = c.Наименование,
                                контактные_данные = a.КонтактныеДанные,
                                адрес = b.Адрес
                            }).ToList();
            return Json(num_info, JsonRequestBehavior.AllowGet);
        }
    }
}
