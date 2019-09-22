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
            IngredientId = 15343, IngredientName = "Tomato", Nutritions = "alot"
            },
            new Ingredient()
            {
            IngredientId = 15444, IngredientName = "Lettuce", Nutritions = "alot"
            },
            new Ingredient()
            {
            IngredientId = 14353, IngredientName = "Potato", Nutritions = "alot"
            }
            };


        // GET api/ingrediant/15343
        public IEnumerable<Ingredient> Get()
        {
            var ctx = new VirtualChefContext();
            var ingredients =(from cat in ctx.Ingredients select cat).ToList();
            return ingredients;
        }
        // GET api/ingrediant/15343
        public Ingredient Get(int id)
        {
            return list.First(e => e.IngredientId == id);
        }

        // POST api/ingrediant/15343
        public void Post(Ingredient ingredient)
        {
            int maxId = list.Max(e => e.IngredientId);
            ingredient.IngredientId = maxId + 1;
            list.Add(ingredient);
        }
        // PUT api/ingrediant/15343
        public void Put(int id, Ingredient ingredient)
        {
            int index = list.ToList().FindIndex(e => e.IngredientId == id);
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
