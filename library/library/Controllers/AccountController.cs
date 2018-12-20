using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Profile;
using System.Web.Security;
using System.Data.Entity.Migrations;

using library.Models;
using System.IO;

namespace library.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult profile()
        {
            string username = User.Identity.Name;
            library_globalContext db = new library_globalContext();
            // Fetch the userprofile
            Клиенты user = db.Клиенты.FirstOrDefault(u => u.Login.Equals(username));

            // Construct the viewmodel
            Клиенты model = new Клиенты();
            model.Фамилия = user.Фамилия;
            model.Имя = user.Имя;
            model.Отчество = user.Отчество;
            model.Age = user.Age;
            model.Адрес = user.Адрес;
            model.BooksBack = user.BooksBack;
            model.BooksReads = user.BooksReads;
            model.Comments = user.Comments;
            model.IdКлиента = user.IdКлиента;
            model.Login = user.Login;
            model.avatar = user.avatar;


            return View(model);
        }
        public ActionResult edit_profile()
        {
            string username = User.Identity.Name;
            library_globalContext db = new library_globalContext();
            // Fetch the userprofile
            Клиенты user = db.Клиенты.FirstOrDefault(u => u.Login.Equals(username));

            // Construct the viewmodel
            Клиенты model = new Клиенты();
            model.Фамилия = user.Фамилия;
            model.Имя = user.Имя;
            model.Отчество = user.Отчество;
            model.Age = user.Age;
            model.Адрес = user.Адрес;
            model.Password = user.Password;
            model.avatar = user.avatar;

            return View(model);
        }
        [HttpPost]
        public ActionResult edit_profile(Клиенты userprofile)
        {
            
            
            if (ModelState.IsValid)
            {
                library_globalContext db = new library_globalContext();
                string username = User.Identity.Name;
                // Get the userprofile
                Клиенты user = db.Клиенты.FirstOrDefault(u => u.Login.Equals(username));

                // Update fields
                string filename = Path.GetFileNameWithoutExtension(userprofile.ImageFile.FileName);
                string extension = Path.GetExtension(userprofile.ImageFile.FileName);
                user.Имя = userprofile.Имя;
                user.Фамилия = userprofile.Фамилия;
                user.Отчество = userprofile.Отчество;
                user.Age = userprofile.Age;
                user.Адрес = userprofile.Адрес;
                user.Password = userprofile.Password;
                filename = filename + DateTime.Now.ToString("ttmmssfff") + extension;
                userprofile.avatar = "~/img/avatars/" + filename;
                user.avatar = filename;
                filename = Path.Combine(Server.MapPath("~/img/avatars"), filename);
                userprofile.ImageFile.SaveAs(filename);
                
                db.Клиенты.Update(user); //requires using System.Data.Entity.Migrations;
                db.SaveChanges();
                

                return RedirectToAction("profile", "account"); // or whatever
            }

            return View(userprofile);
        }

        public ActionResult Register()
        {
            return View();
        }

          
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                Клиенты user = null;
                using (library_globalContext db = new library_globalContext())
                {
                    user = db.Клиенты.FirstOrDefault(u => u.Login == model.Name);
                }
                if (user == null)
                {
                    // создаем нового пользователя
                    using (library_globalContext db = new library_globalContext())
                    {
                        int lastid = db.Клиенты.Max(u => u.IdКлиента);
                        db.Клиенты.Add(new Клиенты { IdКлиента= lastid+1, Login = model.Name, Password = model.Password, IdRole = 2  });
                        db.SaveChanges();

                        user = db.Клиенты.Where(u => u.Login == model.Name && u.Password == model.Password).FirstOrDefault();
                    }
                    // если пользователь удачно добавлен в бд
                    if (user != null)
                    {
                        FormsAuthentication.SetAuthCookie(model.Name, true);
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Пользователь с таким логином уже существует");
                }
            }

            return View(model);
        }
        public ActionResult Logoff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                // поиск пользователя в бд
                Клиенты user = null;
                using (library_globalContext db = new library_globalContext())
                {
                    user = db.Клиенты.FirstOrDefault(u => u.Login == model.Name && u.Password == model.Password);

                }
                if (user != null)
                {
                    FormsAuthentication.SetAuthCookie(model.Name, true);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Пользователя с таким логином и паролем нет");
                }
            }

            return View(model);
        }

        

    }
}