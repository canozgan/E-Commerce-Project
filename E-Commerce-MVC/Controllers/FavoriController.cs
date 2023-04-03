using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DBMS.Controllers
{
    [Authorize]
    public class FavoriController : Controller
    {
        DataEntities db = new DataEntities();
        [Authorize]
        public ActionResult Index()
        {
            int kullaniciID = Int32.Parse((string)Session["kullaniciID"]);
            var model = db.Favoriler.Where(x=>x.KullaniciID==kullaniciID).ToList();
            return View(model);
        }
        [Route("Favori/FavorilereEkle/{barkodNo}")]
        public ActionResult FavorilereEkle(int barkodNo)
        {
            int kullaniciID = Int32.Parse((string)Session["kullaniciID"]);
            Favoriler favoriler = new Favoriler()
            {
                BarkodNo = barkodNo,
                KullaniciID = kullaniciID
            };
            var favoriKontrol = db.Favoriler.Where(x => x.KullaniciID == favoriler.KullaniciID && x.BarkodNo == favoriler.BarkodNo);
            if(favoriKontrol == null)
            {
                db.Favoriler.Add(favoriler);
                db.SaveChanges();
            }
            return RedirectToAction("UrunGoruntule", "Urun", new { BarkodNo = barkodNo });
        }
    }
}