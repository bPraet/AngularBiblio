import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';
import { Location } from '@angular/common';

@Component({
  selector: 'app-cotisation',
  templateUrl: './cotisation.component.html',
  styleUrls: ['./cotisation.component.css']
})
export class CotisationComponent implements OnInit {

  bibliotheques;
  cotisationError = "";

  constructor(private authService : AuthenticationService, private router: Router, private userService: UserService, private location: Location) { 
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }
  }

  ngOnInit(): void {
    this.userService.getBibliCotisation().subscribe(
      bibliotheques => {
        this.bibliotheques = bibliotheques;
      }
    );
  }

  cotiser(id){
    this.userService.cotise(id).subscribe(
      response => {
        this.cotisationError = response;
        document.getElementById('erreur').style.visibility = "visible";
        this.userService.getBibliCotisation().subscribe(
          bibliotheques => {
            this.bibliotheques = bibliotheques;
          }
        );
      }
    )
  }

  back(){
    this.location.back();
  }

}
