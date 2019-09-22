import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then(m => m.HomePageModule)
  },
<<<<<<< HEAD
  
=======
<<<<<<< HEAD

  
=======
<<<<<<< HEAD
  
=======
>>>>>>> 195efd9fbe0dae3e38a143e62060db6913aa8e5e
>>>>>>> 754bb8802de9469675886fcf9e278f4c3180872a
>>>>>>> 1d68fbd67ff7402bb7749682dfb8b5f06b7b4740
  { path: 'login', loadChildren: './login/login.module#LoginPageModule' },
  { path: 'favourite', loadChildren: './favourite/favourite.module#FavouritePageModule' },
  { path: 'settings', loadChildren: './settings/settings.module#SettingsPageModule' },
  { path: 'ingredients', loadChildren: './ingredients/ingredients.module#IngredientsPageModule' },
  { path: 'recipes', loadChildren: './recipes/recipes.module#RecipesPageModule' },
  { path: 'basket', loadChildren: './basket/basket.module#BasketPageModule' }


];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
