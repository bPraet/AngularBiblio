import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-support',
  templateUrl: './support.component.html',
  styleUrls: ['./support.component.css']
})
export class SupportComponent implements OnInit {

  messages;

  constructor(private authService: AuthenticationService, private router: Router, private userService: UserService) {
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }
  }

  ngOnInit(): void {
    this.userService.getMessages().subscribe(
      messages => {
        this.messages = messages;
        console.log(messages);
      }
    );

  }

  dateMilitoDate(milisecondes){
    return new Date(milisecondes).toISOString().slice(0,10);
  }

}
