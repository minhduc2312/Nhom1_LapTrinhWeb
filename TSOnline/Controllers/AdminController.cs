using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TSOnline.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace TSOnline.Controllers
{
    public class AdminController : Controller
    {
        dbQLTraSuaDataContext data = new dbQLTraSuaDataContext();
        // GET: /Admin/
        public ActionResult Index()
        {
            //lấy top bán chạy nhất
            List<TRASUA> list_banchay = new List<TRASUA>();
            var topbanchay = data.topbanchay().ToList();
            foreach(var item in topbanchay)
            {
                TRASUA ts = data.TRASUAs.Where(a => a.MaTS == item.MaTS).FirstOrDefault();
                list_banchay.Add(ts);
            }
            return View(list_banchay);
        }
        public ActionResult TraSua(int ?page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 6 ;
            //return View(data.TRASUAs.ToList());
            return View(data.TRASUAs.ToList().OrderBy(n => n.MaTS).ToPagedList(pageNumber, pageSize));    
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            // Gán các giá trị người dùng nhập liệu cho các biến 
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (ad)        

                Admin ad = data.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        // thêm mới sách
        [HttpGet]
        public ActionResult Themmoits()
        {
            //Dua du lieu vao dropdownList
            //Lay ds tu tabke chu de, sắp xep tang dan trheo ten chu de, chon lay gia tri Ma CD, hien thi thi Tenchude
            ViewBag.MaLoai = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
           // ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult themmoits(TRASUA ts,HttpPostedFileBase fileupload)
        {
            //Dua du lieu vao dropdownload
            ViewBag.MaLoai = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
         //   ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            //Kiem tra duong dan file
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten fie, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileupload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileupload.SaveAs(path);
                    }
                    ts.Anhbia = fileName;
                    //Luu vao CSDL
                    data.TRASUAs.InsertOnSubmit(ts);
                    data.SubmitChanges();
                }
                return RedirectToAction("TraSua");
            }
        }
        public ActionResult Detail(int id)
        {
            TRASUA ts = data.TRASUAs.SingleOrDefault(n => n.MaTS == id);
            ViewBag.MaTS = ts.MaTS; 
            if(ts==null)
            { 
                Response.StatusCode = 404;
                return null;
            }
            return View(ts);
        }
        
        public ActionResult Delete(int id)
        {
            TRASUA ts = data.TRASUAs.SingleOrDefault(n=>n.MaTS==id);
            ViewBag.MaTS = ts.MaTS;
            if (ts == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ts);

        }
        [HttpPost, ActionName("Delete")]
        public ActionResult xoa(int id)
        {
            TRASUA ts = data.TRASUAs.SingleOrDefault(n => n.MaTS == id);
            ViewBag.MaTS = ts.MaTS;
            if (ts == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.TRASUAs.DeleteOnSubmit(ts);
            data.SubmitChanges();
            return RedirectToAction("TraSua");
        }
        [HttpGet]
        public ActionResult sua(int id)
        {
            TRASUA ts = data.TRASUAs.SingleOrDefault(n => n.MaTS == id);
            if (ts == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaLoai = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai", ts.MaLoai);
            return View(ts);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Save(TRASUA ts, HttpPostedFileBase fileupload)
        {
            //Dua du lieu vao dropdownload
            ViewBag.MaTS = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
          //  ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            //Kiem tra duong dan file
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten fie, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileupload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/images/"), fileName);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileupload.SaveAs(path);
                    }
                    ts.Anhbia = fileName;
                    //Luu vao CSDL   
                    UpdateModel(ts);
                    data.SubmitChanges();

                }
                return RedirectToAction("TraSua");
            }
        }
        public ActionResult LoadDoanhThu(DateTime ngaybatdau,DateTime ngayketthuc)
        {
            long doanhthu = long.Parse(data.DoanhThu(ngaybatdau,ngayketthuc).FirstOrDefault());
            return PartialView();
        }

    }
}