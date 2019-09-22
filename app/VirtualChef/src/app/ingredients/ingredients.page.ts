import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-ingredients',
  templateUrl: './ingredients.page.html',
  styleUrls: ['./ingredients.page.scss'],
})
export class IngredientsPage implements OnInit {

  constructor(private router:Router) { }

  goToBasket() {
    this.router.navigate(["/basket"])

  }

  ngOnInit() {
  }

}
