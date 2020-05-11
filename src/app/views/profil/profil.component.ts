import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-profil',
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.css']
})
export class ProfilComponent implements OnInit {

  profil;
  profilError = "";
  profilForm;

  constructor(private authService: AuthenticationService, private router: Router, private userService: UserService, private fb: FormBuilder) { 
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }
  }

  ngOnInit(): void {
    this.userService.getProfil().subscribe(
      profil => {
        this.profil = profil;

        this.profilForm = this.fb.group({
          nom: this.profil.nom,
          prenom: this.profil.prenom,
          login: this.profil.login,
          motDePasse: this.profil.motDePasse,
          email: this.profil.email,
          telephone: this.profil.telephone,
          dNaissance: this.profil.dNaissance,
          adresse: this.profil.adresse
        });
      }
    );
  }



  modify(){
    this.userService.modifyProfil(this.profilForm.value.nom, this.profilForm.value.prenom, this.profilForm.value.login, this.profilForm.value.motDePasse, this.profilForm.value.dNaissance,
      this.profilForm.value.adresse, this.profilForm.value.telephone, this.profilForm.value.email);
  }

  logout(){
    this.authService.logout();
    this.router.navigate(['login']);
  }

}
