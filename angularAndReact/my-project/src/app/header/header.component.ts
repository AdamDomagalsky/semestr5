import { UserService } from './user.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent implements OnInit {

  public userName: string = 'USER';

  constructor(private userService: UserService) { 
    
  }

  ngOnInit() {
    this.userName=this.userService.getUserName();
  }
}
