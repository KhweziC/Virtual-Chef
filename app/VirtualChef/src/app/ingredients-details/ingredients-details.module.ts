import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { IngredientsDetailsPage } from './ingredients-details.page';

const routes: Routes = [
  {
    path: '',
    component: IngredientsDetailsPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [IngredientsDetailsPage]
})
export class IngredientsDetailsPageModule {}
