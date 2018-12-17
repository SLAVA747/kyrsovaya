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
            var num_info = (from a in db.ВыдачаКниг
                            join b in db.Читатели on a.IdЧитателя equals b.IdЧитателя
                            select new
                            {
                                bla1 = b.IdВидКонтакта,
                                bla2 = b.КонтактныеДанные
                            }).ToList();
            return Json(num_info, JsonRequestBehavior.AllowGet);
        }
    }
}
