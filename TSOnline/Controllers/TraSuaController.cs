using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TSOnline.Models;
using PagedList;
using PagedList.Mvc;

namespace TSOnline.Controllers
{
    public class TraSuaController : Controller
    {
        dbQLTraSuaDataContext data = new dbQLTraSuaDataContext();
        // GET: TraSua

        private List<TRASUA> trasuamoi(int count)
        {
            return data.TRASUAs.OrderByDescending(a => a.MaTS).Take(count).ToList();
        }

        public ActionResult Index(int ? page)
        {
            // tao số sp trên trang
            int pageSize = 6;
            int pageNum = (page ?? 1);
            //lấy top bán chạy nhất
            var tsmoi = data.TRASUAs.ToList();
            return View(tsmoi.ToPagedList(pageNum,pageSize));
        }
        public ActionResult GetTop()
        {
            //lấy top bán chạy nhất
            var tsmoi = trasuamoi(10);
            return PartialView(tsmoi);
        }
        public ActionResult List_Banner()
        {
            List<TRASUA> list_ts = trasuamoi(5);

            return PartialView(list_ts);
        }
        public ActionResult Loai()
        {
            var loai = from LOAI in data.LOAIs select LOAI;
            return PartialView(loai);
        }
        public ActionResult Details(int id)
        {
            var trasua = data.TRASUAs.Where(a=> a.MaTS == id).FirstOrDefault();
            ViewBag.TenSP = data.LOAIs.Where(a => a.MaLoai == trasua.MaLoai).FirstOrDefault().TenLoai;
            return View(trasua);
        }
        public ActionResult DS_Loai()
        {
            var list_loai = data.LOAIs.ToList();
            return PartialView(list_loai);
        }
        public ActionResult Related(int id)
        {
            var list_related = data.TRASUAs.Where(a => a.MaLoai == id).ToList();
            return PartialView(list_related);
        }
        

    }
}