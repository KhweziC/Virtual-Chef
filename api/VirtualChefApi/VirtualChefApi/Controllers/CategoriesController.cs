using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VirtualChefApi.Models;

namespace VirtualChefApi.Controllers
{
    public class CategoriesController : ApiController
    {

        private static IList<Categories> list = new List<Categories>()

             {


            new Categories()
            {
            CategoryId = 123477, CategoryName = "Fruits", Description = "this is for fruits" , ImageURL = ""},
            new Categories()
            {
            CategoryId = 12378, CategoryName = "Vegatables", Description = "this is for veggies" , ImageURL = ""
            },
            new Categories()
            {
            CategoryId = 12379, CategoryName = "Meat",  Description = "this is for meat ", ImageURL = ""
            }
            };


        // GET api/categories
        public IEnumerable<Categories> Get()
        {
            return list;
        }
        // GET api/categories/123477
        public Categories Get(int id)
        {
            return list.First(e => e.CategoryId == id);
        }

        // POST api/categories
        public void Post(Categories categories)
        {
            int maxId = list.Max(e => e.CategoryId);
            categories.CategoryId = maxId + 1;
            list.Add(categories);
        }
        // PUT api/categories/123477
        public void Put(int id, Categories categories)
        {
            int index = list.ToList().FindIndex(e => e.CategoryId == id);
            list[index] = categories;
        }
        // DELETE api/categories/123477
        public void Delete(int id)
        {
            Categories categories = Get(id);
            list.Remove(categories);
        }
    }
}
