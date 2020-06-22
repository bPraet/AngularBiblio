import { Component, OnInit } from '@angular/core';
import { LivreService } from 'src/app/services/livre.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';


@Component({
  selector: 'app-catalogue',
  templateUrl: './catalogue.component.html',
  styleUrls: ['./catalogue.component.css']
})
export class CatalogueComponent implements OnInit {

  livresDispo;
  livresIndispo;
  admin = false;

  constructor(private authService: AuthenticationService, private router: Router, private livresServ: LivreService, private userService: UserService) {
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }

    this.userService.getProfil().subscribe(
      profil => {
        if(profil['role'] != undefined)
          this.admin = true;     
      }
    );
  }

  ngOnInit(): void {
    this.livresServ.getCatalogue().subscribe(res => {
      this.livresDispo = res['true'];
      this.livresIndispo = res['false'];
    });

  }

}
