using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualChefApi.Models
{
    public class Recipe
    {
        public int RecipeId { get; set; }
        public string RecipeName { get; set; }
        public string Directions { get; set; }
        public int PrepTime { get; set; }
        public int CookTime { get; set; }
        public int ReadyIn { get; set; }
        public string Author { get; set; }
        public DateTime Date { get; set; }

    }
}