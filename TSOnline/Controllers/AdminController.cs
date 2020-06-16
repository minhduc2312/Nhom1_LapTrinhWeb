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
            if(Session["Taikhoanadmin"] != null)
            {
                //lấy top bán chạy nhất
                List<TRASUA> list_banchay = new List<TRASUA>();
                var topbanchay = data.topbanchay().ToList();
                foreach (var item in topbanchay)
                {
                    TRASUA ts = data.TRASUAs.Where(a => a.MaTS == item.MaTS).FirstOrDefault();
                    list_banchay.Add(ts);
                }
                return View(list_banchay);
            }else if(Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
                        
        }
        public ActionResult TraSua(int ?page)
        {
            if (Session["Taikhoanadmin"] != null)
            {
                int pageNumber = (page ?? 1);
                int pageSize = 6;
                //return View(data.TRASUAs.ToList());
                return View(data.TRASUAs.ToList().OrderBy(n => n.MaTS).ToPagedList(pageNumber, pageSize));
            }
            else if (Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
               
        }        
        // thêm mới sách
        [HttpGet]
        public ActionResult Themmoits()
        {
            if (Session["Taikhoanadmin"] != null)
            {
                //Dua du lieu vao dropdownList
                //Lay ds tu tabke chu de, sắp xep tang dan trheo ten chu de, chon lay gia tri Ma CD, hien thi thi Tenchude
                ViewBag.MaLoai = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
                return View();
            }
            else if (Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult themmoits(TRASUA ts,HttpPostedFileBase fileupload)
        {            
                //Dua du lieu vao dropdownload
                ViewBag.MaLoai = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
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
                        var path = Path.Combine(Server.MapPath("~/img"), fileName);
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
            if (Session["Taikhoanadmin"] != null)
            {
                TRASUA ts = data.TRASUAs.SingleOrDefault(n => n.MaTS == id);
                ViewBag.MaTS = ts.MaTS;
                if (ts == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return PartialView(ts);
            }
            else if (Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            
        }
        
        public ActionResult Delete(int id)
        {
            if (Session["Taikhoanadmin"] != null)
            {
                TRASUA ts = data.TRASUAs.SingleOrDefault(n => n.MaTS == id);
                ViewBag.MaTS = ts.MaTS;
                if (ts == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(ts);
            }
            else if (Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }           

        }
        [HttpPost, ActionName("Delete")]
        public ActionResult xoa(int id)
        {
            if (Session["Taikhoanadmin"] != null)
            {
                TRASUA ts = data.TRASUAs.SingleOrDefault(n => n.MaTS == id);
                CHITIETDONTHANG ctdh = data.CHITIETDONTHANGs.Where(a => a.MaTS == ts.MaTS).Single();
                ViewBag.MaTS = ts.MaTS;
                if (ts == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                if(ctdh != null)
                {
                    ViewBag.ThongBao = "Không thể xoá sản phẩm này vì còn tồn tại ở chi tiết đặt hàng";
                    return PartialView();
                }
                else
                {
                    data.TRASUAs.DeleteOnSubmit(ts);
                    data.SubmitChanges();
                }
                
                return RedirectToAction("TraSua");
            }
            else if (Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["Taikhoanadmin"] != null)
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
            else if (Session["Taikhoan"] != null)
            {
                return RedirectToAction("Index", "TraSua");
            }
            else
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(TRASUA ts, HttpPostedFileBase fileupload)
        {
            //Dua du lieu vao dropdownload
            ViewBag.MaLoai = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai", ts.MaLoai);

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
                    var path = Path.Combine(Server.MapPath("~/img/"), fileName);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        return View();
                    }
                        
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
            
            return PartialView();
        }
        public ActionResult KhachHang()
        {
            var list_kh = data.KHACHHANGs.ToList();
            return View(list_kh);
        }

    }
}