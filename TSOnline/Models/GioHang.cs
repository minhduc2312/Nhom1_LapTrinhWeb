using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TSOnline.Models;

namespace TSOnline.Models
{
    public class GioHang
    {
        dbQLTraSuaDataContext data = new dbQLTraSuaDataContext();
        public int iMaTS { set; get; }
        public string sTenTS { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }

        }
        //Khoi tao gio hàng theo Masach duoc truyen vao voi Soluong mac dinh la 1
        public GioHang(int MaTS)
        {
            iMaTS = MaTS;
            TRASUA trasua = data.TRASUAs.Single(n => n.MaTS == iMaTS);
            sTenTS = trasua.TenTS;
            sAnhbia = trasua.Anhbia;
            dDongia = double.Parse(trasua.Giaban.ToString());
            iSoluong = 1;
        }
    }
}