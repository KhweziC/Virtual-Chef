using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VirtualChefApi.Models;

namespace VirtualChefApi.Controllers
{
    public class RecipeController : ApiController
    {

        private static IList<Recipe> list = new List<Recipe>()

             {

            new Recipe()
            {
            RecipeId = 15343, RecipeName = "Million-Dollar Spaghetti", Directions =
                "1.Preheat oven to 350 degrees F (175 degrees C)." +
                "2.Bring a large pot of lightly salted water to a boil. Cook spaghetti in the boiling water, stirring occasionally until cooked through but firm to the bite, about 12 minutes. Drain. " +
                "3.Heat a large skillet over medium-high heat. Cook and stir beef in the hot skillet until browned and crumbly, 5 to 7 minutes; drain and discard grease. Transfer to a bowl and mix spaghetti sauce into ground beef." +
                "4.Place half the slices of butter into the bottom of a 9x13-inch casserole dish. Spread half the spaghetti into the dish. Mix cottage cheese, cream cheese, and sour cream together in a bowl; spread mixture over spaghetti. Layer remaining spaghetti over creamy mixture. Top with remaining pats of butter." +
                "5.Pour ground beef mixture over spaghetti and spread to cover casserole. 6.Bake in the preheated oven for 30 minutes. Spread Cheddar cheese over casserole and continue baking until cheese has melted and is lightly browned, about 15 more minutes.",
                PrepTime = 30 , CookTime = 45, ReadyIn = 60, Author = "Mark Yao",Date = Convert.ToDateTime("2019-09-14")
            }

            };

        // GET api/Recipe
        public IEnumerable<Recipe> Get()
        {
            var ctx = new VirtualChefContext();
            var recipes = (from cat in ctx.recipes select cat).ToList();

            return recipes;
        }
        // GET api/Recipe/15343
        public Recipe Get(int id)
        {
            return list.First(e => e.RecipeId == id);
        }

        // POST api/Recipe/15343
        public void Post(Recipe recipe)
        {
            int maxId = list.Max(e => e.RecipeId);
            recipe.RecipeId = maxId + 1;
            list.Add(recipe);
        }
        // PUT api/Recipe/15343
        public void Put(int id, Recipe recipe)
        {
            int index = list.ToList().FindIndex(e => e.RecipeId == id);
            list[index] = recipe;
        }
        // DELETE api/Recipe/15343
        public void Delete(int id)
        {
            Recipe recipe = Get(id);
            list.Remove(recipe);
        }
    }
}
