using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VirtualChefApi.Models;

namespace VirtualChefApi.Controllers
{
    public class IngredientController : ApiController
    {
        private static IList<Ingredient> list = new List<Ingredient>()

            {

            new Ingredient()
            {
            IngrediantId = 15343, IngrediantName = "Tomato", Nutritions = "alot"
            },
            new Ingredient()
            {
            IngrediantId = 15444, IngrediantName = "Lettuce", Nutritions = "alot"
            },
            new Ingredient()
            {
            IngrediantId = 14353, IngrediantName = "Potato", Nutritions = "alot"
            }
            };


        // GET api/ingrediant/15343
        public IEnumerable<Ingredient> Get()
        {
            return list;
        }
        // GET api/ingrediant/15343
        public Ingredient Get(int id)
        {
            return list.First(e => e.IngrediantId == id);
        }

        // POST api/ingrediant/15343
        public void Post(Ingredient ingredient)
        {
            int maxId = list.Max(e => e.IngrediantId);
            ingredient.IngrediantId = maxId + 1;
            list.Add(ingredient);
        }
        // PUT api/ingrediant/15343
        public void Put(int id, Ingredient ingredient)
        {
            int index = list.ToList().FindIndex(e => e.IngrediantId == id);
            list[index] = ingredient;
        }
        // DELETE api/ingrediant/15343
        public void Delete(int id)
        {
            Ingredient ingredient = Get(id);
            list.Remove(ingredient);
        }

    }
}
