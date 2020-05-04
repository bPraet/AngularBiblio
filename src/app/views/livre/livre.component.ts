import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router, ActivatedRoute } from '@angular/router';
import { LivreService } from 'src/app/services/livre.service';

@Component({
  selector: 'app-livre',
  templateUrl: './livre.component.html',
  styleUrls: ['./livre.component.css']
})
export class LivreComponent implements OnInit {

  livre;

  constructor(private authService: AuthenticationService, private router: Router, private livresServ: LivreService, private route: ActivatedRoute) {
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }
  }

  ngOnInit(): void {
    this.livresServ.getLivre(this.route.snapshot.params.id).subscribe(livre =>{
      console.log(livre);
    })
  }

}
