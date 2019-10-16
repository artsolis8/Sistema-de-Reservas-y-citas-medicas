using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Sistema_Reservas_y_Citas.Models;

namespace Sistema_Reservas_y_Citas.Controllers
{
    public class ConsultoriosController : Controller
    {
        private ConsultaMedicaEntities db = new ConsultaMedicaEntities();

        // GET: Consultorios
        [Authorize]
        public async Task<ActionResult> Index()
        {
            return View(await db.Consultorio.ToListAsync());
        }
        [Authorize]
        // GET: Consultorios/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consultorio consultorio = await db.Consultorio.FindAsync(id);
            if (consultorio == null)
            {
                return HttpNotFound();
            }
            return View(consultorio);
        }
        [Authorize]
        // GET: Consultorios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Consultorios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "id,descripcion,clinica")] Consultorio consultorio)
        {
            if (ModelState.IsValid)
            {
                db.Consultorio.Add(consultorio);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(consultorio);
        }
        [Authorize]
        // GET: Consultorios/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consultorio consultorio = await db.Consultorio.FindAsync(id);
            if (consultorio == null)
            {
                return HttpNotFound();
            }
            return View(consultorio);
        }

        // POST: Consultorios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "id,descripcion,clinica")] Consultorio consultorio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consultorio).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(consultorio);
        }
        [Authorize]
        // GET: Consultorios/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consultorio consultorio = await db.Consultorio.FindAsync(id);
            if (consultorio == null)
            {
                return HttpNotFound();
            }
            return View(consultorio);
        }

        // POST: Consultorios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Consultorio consultorio = await db.Consultorio.FindAsync(id);
            db.Consultorio.Remove(consultorio);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
