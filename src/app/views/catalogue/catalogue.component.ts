import { Component, OnInit } from '@angular/core';
import { LivreService } from 'src/app/services/livre.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-catalogue',
  templateUrl: './catalogue.component.html',
  styleUrls: ['./catalogue.component.css']
})
export class CatalogueComponent implements OnInit {

  livresDispo;
  livresIndispo;

  constructor(private authService: AuthenticationService, private router: Router, private livresServ: LivreService) {
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }
  }

  ngOnInit(): void {
    this.livresServ.getCatalogue().subscribe(res => {
      this.livresDispo = res['true'];
      this.livresIndispo = res['false'];
    });
  }

}
