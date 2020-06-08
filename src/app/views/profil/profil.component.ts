import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';
import { FormBuilder } from '@angular/forms';
import { AdminService } from 'src/app/services/admin.service';

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
  isAdmin = false;

  bibli = false;
  livre = false;
  exemplaire = false;
  location = false;
  user = false;
  admin = false;
  support = false;

  bibliotheques;
  livres;
  exemplaires;

  constructor(private authService: AuthenticationService, private router: Router, private userService: UserService, private adminService: AdminService, private fb: FormBuilder) { 
    if(!this.authService.isUserLoggedIn()){
      this.router.navigate(['login']);
    }
  }

  ngOnInit(): void {
    this.userService.getProfil().subscribe(
      profil => {
        this.profil = profil;
 
        if(profil['role'] != undefined)
          this.isAdmin = true;
        else
          this.isAdmin = false;


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
      }
    );

    this.userService.getLocations().subscribe(
      locations => {
        this.locations = locations;
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

  dateMilitoDate(milisecondes){
    return new Date(milisecondes).toISOString().slice(0,10);
  }

  changeViewAdmin(choice){
    switch(choice){
      case 'bibli':
        this.bibli = true;  this.livre = false;  this.exemplaire = false;  this.location = false;  this.user = false;  this.admin = false;  this.support = false;
        this.adminService.getBibliotheques().subscribe(
          bibliotheques => {
            this.bibliotheques = bibliotheques;
          }
        );
        break;
      case 'livre':
        this.bibli = false;  this.livre = true;  this.exemplaire = false;  this.location = false;  this.user = false;  this.admin = false;  this.support = false;
        this.adminService.getLivres().subscribe(
          livres => {
            this.livres = livres;
          }
        );
        break;
      case 'exemplaire':
        this.bibli = false;  this.livre = false;  this.exemplaire = true;  this.location = false;  this.user = false;  this.admin = false;  this.support = false;
        this.adminService.getExemplaires().subscribe(
          exemplaires => {
            this.exemplaires = exemplaires;
          }
        );
        break;
      case 'location':
        this.bibli = false;  this.livre = false;  this.exemplaire = false;  this.location = true;  this.user = false;  this.admin = false;  this.support = false;
        break;
      case 'user':
        this.bibli = false;  this.livre = false;  this.exemplaire = false;  this.location = false;  this.user = true;  this.admin = false;  this.support = false;
        break;
      case 'admin':
        this.bibli = false;  this.livre = false;  this.exemplaire = false;  this.location = false;  this.user = false;  this.admin = true;  this.support = false;
        break;
      case 'support':
        this.bibli = false;  this.livre = false;  this.exemplaire = false;  this.location = false;  this.user = false;  this.admin = false;  this.support = true;
        break;
    }  
  }

  deleteBibli(id){
    if(confirm("Etes-vous sûr ?")){
      this.adminService.deleteBibli(id).subscribe(
        response => {
          this.adminService.getBibliotheques().subscribe(
            bibliotheques => {
              this.bibliotheques = bibliotheques;
            }
          );
        }
      )
    }
  }

  deleteExemplaire(id){
    if(confirm("Etes-vous sûr ?")){
      this.adminService.deleteExemplaire(id).subscribe(
        response => {
          this.adminService.getExemplaires().subscribe(
            exemplaires => {
              this.exemplaires = exemplaires;
            }
          );
        }
      )
    }
  }
}
