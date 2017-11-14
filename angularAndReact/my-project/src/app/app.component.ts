import { Component } from '@angular/core';

@Component({
  selector: 'root-shop  ',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Mieszko';
  public changeTitle(){
    this.title = 'Maciej'
  }
}
