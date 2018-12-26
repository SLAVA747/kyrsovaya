﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using library.Models;

namespace library.Controllers
{
    public class HomeController : Controller
    {
        library_globalContext db = new library_globalContext();
        public ActionResult page()
        {


            return View();
        }
        [HttpGet]
        public JsonResult page_result_comments(int id_book)
        {

            var comment_info = (from a in db.Комментарии
                              join b in db.Клиенты on a.IdКлиента equals b.IdКлиента
                              join c in db.Книги on a.IdКниги equals c.IdКниги

                                where a.IdКниги == id_book
                                orderby a.IdКомментария descending
                                select new
                              {
                                  Фамилия = b.Фамилия,
                                  текст = a.Text,
                                  image = b.Avatar
                              }).ToList().Take(10);
            return Json(comment_info, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult page_result(int id_book)
        {

            var books_info = (from a in db.Книги
                              join b in db.Авторы on a.IdАвтора equals b.IdАвтора
 
                              where a.IdКниги == id_book
                              select new
                              {
                                  id_book = a.IdКниги,
                                  Название = a.НазваниеКниги,
                                  Img = a.ImgSrc,
                                  описание = a.Описание,
                                  автор = b.Фио,
                                  Дата = a.ДатаДобавления,
                                  Рейтинг = a.Рейтинг

                              }).ToList();
            return Json(books_info, JsonRequestBehavior.AllowGet);
        }

        public ActionResult add_books()
        {


            return View();
        }


        [HttpPost]
        public ActionResult add_books(Книги books, int id_avtor)
        {


            if (ModelState.IsValid)
            {
                library_globalContext db = new library_globalContext();
                Книги model = new Книги();
                string filename = Path.GetFileNameWithoutExtension(books.ImageFile_add_book.FileName);
                string extension = Path.GetExtension(books.ImageFile_add_book.FileName);
                
                model.IdКниги = db.Книги.Max(u => u.IdКниги+1);
                model.НазваниеКниги = books.НазваниеКниги;
                model.Описание = books.Описание;
                model.ДатаДобавления = DateTime.Now;
                model.Рейтинг = 0;
                model.IdАвтора = id_avtor;
                filename = filename + DateTime.Now.ToString("ttmmssfff") + extension;
                books.ImgSrc = "~/img/books/" + filename;
                model.ImgSrc = filename;
                filename = Path.Combine(Server.MapPath("~/img/books"), filename);
                books.ImageFile_add_book.SaveAs(filename);

                db.Книги.Add(model); //requires using System.Data.Entity.Migrations;
                db.SaveChanges();


                return RedirectToAction("index", "home"); // or whatever
            }

            return RedirectToAction("add_books", "home");
        }



        public ActionResult search()
        {


            return View();
        }
        public ActionResult search_result()
        {


            return View();
        }
        public JsonResult Search_json_result_total(int type, string text)
        {
            object search_info = null;
            int count_books = db.Книги.Count();
            var text2 = text;
            text = text.ToLower();
            text = text.Substring(0, 1).ToUpper() + text.Remove(0, 1);
            text2 = text2.ToLower();

            if (type == 1)
            {
                search_info = (from a in db.Книги
                               join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                               orderby a.IdКниги descending
                               where a.НазваниеКниги.Contains(text2) || a.НазваниеКниги.Contains(text)

                               select new
                               {
                                   id_book = a.IdКниги,
                                   Название = a.НазваниеКниги,
                                   Img = a.ImgSrc,
                                   описание = a.Описание,
                                   автор = b.Фио,
                                   Дата = a.ДатаДобавления,
                                   Рейтинг = a.Рейтинг

                               }).ToList();
            }
            else if (type == 2)
            {
                search_info = (from a in db.Книги
                               join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                               orderby a.IdКниги descending
                               where b.Фио.Contains(text)
                               select new
                               {
                                   id_book = a.IdКниги,
                                   Название = a.НазваниеКниги,
                                   Img = a.ImgSrc,
                                   описание = a.Описание,
                                   автор = b.Фио,
                                   Дата = a.ДатаДобавления,
                                   Рейтинг = a.Рейтинг

                               }).ToList();
            }
            else if (type == 3)
            {
                search_info = (from a in db.Книги
                               join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                               orderby a.IdКниги descending
                               where b.Фио.Contains(text)
                               select new
                               {
                                   id_book = a.IdКниги,
                                   Название = a.НазваниеКниги,
                                   Img = a.ImgSrc,
                                   описание = a.Описание,
                                   автор = b.Фио,
                                   Дата = a.ДатаДобавления,
                                   Рейтинг = a.Рейтинг

                               }).ToList();
            }
            return Json(search_info, JsonRequestBehavior.AllowGet);
        }
        public JsonResult search_json_result(int type,string text, int page)
        {
            object search_info = null;
            int count_books = db.Книги.Count();
            var text2 = text;
            text = text.ToLower();
            text = text.Substring(0, 1).ToUpper() + text.Remove(0, 1);
            text2 = text2.ToLower();

            if (type == 1) {
                search_info = (from a in db.Книги
                               join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                               orderby a.IdКниги descending
                               where a.НазваниеКниги.Contains(text2) || a.НазваниеКниги.Contains(text)

                               select new
                               {
                                      id_book = a.IdКниги,
                                      Название = a.НазваниеКниги,
                                      Img = a.ImgSrc,
                                      описание = a.Описание,
                                      автор = b.Фио,
                                      Дата = a.ДатаДобавления,
                                      Рейтинг = a.Рейтинг

                                  }).ToList().Skip(page*9).Take(9);
            } else if(type == 2)
            {
               search_info = (from a in db.Книги
                                  join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                                  orderby a.IdКниги descending
                                  where b.Фио.Contains(text)
                                  select new
                                  {
                                      id_book = a.IdКниги,
                                      Название = a.НазваниеКниги,
                                      Img = a.ImgSrc,
                                      описание = a.Описание,
                                      автор = b.Фио,
                                      Дата = a.ДатаДобавления,
                                      Рейтинг = a.Рейтинг

                                  }).ToList().Skip(page * 9).Take(9);
            } else if(type == 3)
            {
                search_info = (from a in db.Книги
                                  join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                                  orderby a.IdКниги descending
                                  where b.Фио.Contains(text)
                                  select new
                                  {
                                      id_book = a.IdКниги,
                                      Название = a.НазваниеКниги,
                                      Img = a.ImgSrc,
                                      описание = a.Описание,
                                      автор = b.Фио,
                                      Дата = a.ДатаДобавления,
                                      Рейтинг = a.Рейтинг

                                  }).ToList().Skip(page * 9).Take(9);
            }

            
            return Json(search_info, JsonRequestBehavior.AllowGet);
        }






        [HttpGet]
        public JsonResult Index_books()
        {

            var books_info = (from a in db.Книги
                              join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                              orderby a.IdКниги descending
                              select new
                              {
                                 id_book = a.IdКниги,
                                 Название = a.НазваниеКниги,
                                 Img = a.ImgSrc,
                                 описание = a.Описание,
                                 автор = b.Фио,
                                 Дата = a.ДатаДобавления,
                                 Рейтинг = a.Рейтинг

                             }).ToList();
            return Json(books_info, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {


            return View();
        }
        public ActionResult Index_next()
        {


            return View();
        }

        [HttpGet]
        public JsonResult total_book_json()
        {
            
            var books_json = (from a in db.Книги
                              select new
                              {
                               id = a.IdКниги
                               }).ToList();

            return Json(books_json, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Index_avtors()
        {
            var avtor_json = (from a in db.Авторы
                              select new
                              {
                                 id_avtor = a.IdАвтора,
                                 фио = a.Фио
                              }).ToList();

            return Json(avtor_json, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Index_book_json(int i)
        {
            int count_books = db.Книги.Count();
            var books_json = (from a in db.Книги
                              join b in db.Авторы on a.IdАвтора equals b.IdАвтора
                              where a.IdКниги <= count_books -(i * 9)
                              orderby a.IdКниги descending

                              select new
                              {
                                  id_book = a.IdКниги,
                                  Название = a.НазваниеКниги,
                                  Img = a.ImgSrc,
                                  описание = a.Описание,
                                  автор = b.Фио,
                                  Дата = a.ДатаДобавления,
                                  Рейтинг = a.Рейтинг
                                 

                              }).ToList();

            return Json(books_json, JsonRequestBehavior.AllowGet);
        }
        public ActionResult readers()
        {


            return View();
        }
        public ActionResult SVK()
        {


            return View();
        }


        [HttpGet]
        public JsonResult Index_rate()
        {

            var rate_info = (from a in db.Клиенты
                            orderby a.Rate descending
                            select new
                            {
                                Фамилия = a.Фамилия,
                                Рейтинг = a.Rate,
                                Аватар = a.Avatar
                            }).ToList().Take(10);
            return Json(rate_info, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult Index_comments()
        {

            var com_info = (from a in db.Комментарии
                            join b in db.Клиенты on a.IdКлиента equals b.IdКлиента
                            orderby a.IdКомментария descending
                            select new
                            {
                                Фамилия = b.Фамилия,
                                id_юзера = b.IdКлиента,
                                Комментарий = a.Text,
                                Аватар = b.Avatar
                            }).ToList().Take(10);
            return Json(com_info, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Index_library()
        {
 
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
        [HttpGet]
        public JsonResult Index_SVK()
        {
            var num_info = (from a in db.ВыдачаКниг
                            join b in db.Полка on a.IdПолки equals b.IdПолки
                            join c in db.Читатели on a.IdЧитателя equals c.IdЧитателя
                            join d in db.Клиенты on c.IdКлиента equals d.IdКлиента
                            join e in db.Книги on b.IdКниги equals e.IdКниги
                            join f in db.Штрафы on a.IdШтрафа equals f.IdШтрафа
                            select new
                            {
                                Id_выдачи = a.IdВыдачи,
                                Фамилия = d.Фамилия,
                                Имя = d.Имя,
                                Отчество = d.Отчество,
                                наим_книги = e.НазваниеКниги,
                                Дата_выдачи = a.ДатаВыдачи,
                                одв = a.ОжидаемаяДатаВозврата,
                                фдв = a.ФактическаяДатаВозврата,
                                штраф = f.ШтрафнаяСумма
                            }).ToList();
            return Json(num_info, JsonRequestBehavior.AllowGet);
        }
    }
}
