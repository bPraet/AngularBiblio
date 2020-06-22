import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-inscription',
  templateUrl: './inscription.component.html',
  styleUrls: ['./inscription.component.css']
})
export class InscriptionComponent implements OnInit {

  inscriptionError;

  constructor(private fb: FormBuilder, private authService: AuthenticationService, private router: Router) {
    if(this.authService.isUserLoggedIn()){
      this.router.navigate(['catalogue']);
    }
  }

  inscriptionForm = this.fb.group({
    nom: "",
    prenom: "",
    login: "",
    motDePasse: "",
    email: "",
    telephone: "",
    dNaissance: "",
    adresse: ""
  });

  ngOnInit(): void {
  }

  onSubmit(){
    this.authService.register(this.inscriptionForm.value.nom, this.inscriptionForm.value.prenom, this.inscriptionForm.value.login, this.inscriptionForm.value.motDePasse,
      this.inscriptionForm.value.email, this.inscriptionForm.value.telephone, this.inscriptionForm.value.dNaissance, this.inscriptionForm.value.adresse).subscribe(
      response => {
        if(response == "done")
          this.authService.executeJWTAuthenticationService(this.inscriptionForm.value.login, this.inscriptionForm.value.motDePasse);
        else{
          document.getElementById('erreur').style.visibility = "visible";
          this.inscriptionError = response;
        }
      });
  }

}
