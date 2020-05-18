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
  amendes;
  locations;
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
          motDePasse: "",
          email: this.profil.email,
          telephone: this.profil.telephone,
          dNaissance: this.profil.dateNaissance,
          adresse: this.profil.adresse
        });
      }
    );

    this.userService.getAmendes().subscribe(
      amendes => {
        this.amendes = amendes;
        console.log(amendes);
      }
    );

    this.userService.getLocations().subscribe(
      locations => {
        this.locations = locations;
        console.log(locations);
      }
    )

  }



  modify(){

    if(this.profilForm.value.motDePasse === "")
      this.profilForm.value.motDePasse = this.profil.motDePasse;

    this.userService.modifyProfil(this.profilForm.value.nom, this.profilForm.value.prenom, this.profilForm.value.login, this.profilForm.value.motDePasse, this.profilForm.value.dNaissance,
      this.profilForm.value.adresse, this.profilForm.value.telephone, this.profilForm.value.email).subscribe(
        response => {
          this.profilError = response;
          document.getElementById('erreur').style.visibility = "visible";
        }
      );
  }

  logout(){
    this.authService.logout();
    this.router.navigate(['login']);
  }

}
