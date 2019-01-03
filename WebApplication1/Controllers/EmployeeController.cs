using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.db;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    
    public class EmployeeController : Controller
    {
        PracmvcEntities db = new PracmvcEntities();
        // GET: Employee
        public ActionResult Index()
        {
            Employee emp = new Employee();
            emp.AvailableDesig = GetDesig();
            return View(emp);
        }


      
        [HttpGet]
        public ActionResult Create()
        {
            Employee emp = new Employee();
            emp.AvailableDesig = GetDesig();
            return View(emp);
        }
        [HttpGet]
        public ActionResult Insertdata(Employee model)
        {
            bool gender = false;
            if (model.empid == null)
            {


                
                if (model.gender == "Male")
                {
                    gender = true;
                }

                db.insertemployeedata(model.empname, gender, model.designationid, model.empemail, model.empsalary, model.date);
                db.SaveChanges();

                return Json("success", JsonRequestBehavior.AllowGet);
            }
            //edit
           
            if (model.gender == "Male")
            {
                gender = true;
            }

            db.updateemployeedata(model.empid,model.empname, gender, model.designationid, model.empemail, model.empsalary, model.date);
            db.SaveChanges();

            return Json("success", JsonRequestBehavior.AllowGet);
        }
        
        [HttpGet]
        public ActionResult GetAddUpdate()
        {
            Employee emp = new Employee();
            emp.AvailableDesig = GetDesig();
            return PartialView("_AddUpdateData", emp);
        }
        [HttpGet]
        public ActionResult Getpartialdata()
        {
            List<Employee> emp = db.selectemployeedata(0).Select(e => new Employee
            {
                empid = e.empid,
                empname = e.empname,
                empsalary = Convert.ToDecimal(e.empsalary),
                empemail = e.empemail,
                gender = e.gender.ToString(),
                name = db.designations.Where(a => a.id == e.designationid).FirstOrDefault().name,
                id=e.id,
                date=e.date
            }).ToList();

            return PartialView("_PartialGrid", emp);
        }

        public IList<SelectListItem> GetDesig()
        {
            // This comes from database.       
            var desig = db.selectemployeeedesignation()
                .Select(x => new SelectListItem { Text = x.name, Value = x.id.ToString() })
                .ToList();
            desig.Insert(0, new SelectListItem { Text = "--Please Select--", Value = "" });
            return desig;
        }
        [HttpPost]
        public ActionResult Edit(int id)
        {
            Employee emp = db.selectemployeedata(id).Select(e => new Employee
            {
                empid = e.empid,
                empname = e.empname,
                empsalary = Convert.ToDecimal(e.empsalary),
                empemail = e.empemail,
                gender = e.gender.ToString()=="True"? "Male" : "Female",
                name = db.designations.Where(a => a.id == e.designationid).FirstOrDefault().name,
                id = e.id,
                date = e.date,
                designationid=e.designationid
                                
            }).FirstOrDefault();
                        
            emp.AvailableDesig = GetDesig();
            return PartialView("_AddUpdateData", emp);
            
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            db.deleteemployee(id);
            db.SaveChanges();
            // This comes from database.       
            return Json("success", JsonRequestBehavior.AllowGet);
        }
       
    }
}