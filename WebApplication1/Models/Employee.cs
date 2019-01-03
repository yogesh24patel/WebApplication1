using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Models
{
    public class Employee
    {
        public Employee()
        {
            AvailableDesig = new List<SelectListItem>();
        }
        public int? empid { get; set; }
        [Required(ErrorMessage = "Name Required.")]
        public string empname { get; set; }
        [Required(ErrorMessage = "Gender Required.")]
        public string gender { get; set; }
        [Required(ErrorMessage = "Please Select {0}.")]
        public Nullable<int> designationid { get; set; }
        [Required(ErrorMessage = "Email Address Required.")]
        public string empemail { get; set; }
        [Required(ErrorMessage = "Salary Required.")]
        public Nullable<System.Decimal> empsalary { get; set; }
        [Required(ErrorMessage = "Date Required.")]
        public Nullable<System.DateTime> date { get; set; }
        public int id { get; set; }
        public string name { get; set; }
        public IList<SelectListItem> AvailableDesig { get; set; }
        public IList<Employeedesignation> desig { get; set; }

    }

    public class Employeedesignation
    {
        public int id { get; set; }
        public string name { get; set; }
    }
}