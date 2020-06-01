import { Component, OnInit } from '@angular/core';
import { AdminService } from 'src/app/services/admin.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from 'src/app/services/user.service';
import { FormBuilder } from '@angular/forms';
import { Location } from '@angular/common';

@Component({
  selector: 'app-bibli-admin',
  templateUrl: './bibli-admin.component.html',
  styleUrls: ['./bibli-admin.component.css']
})
export class BibliAdminComponent implements OnInit {

  bibliotheque;
  bibliForm;
  bibliError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private route: ActivatedRoute, private fb: FormBuilder, private location: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.adminService.getBibliotheque(this.route.snapshot.params.id).subscribe(
      bibliotheque => {
        this.bibliotheque = bibliotheque;

        this.bibliForm = this.fb.group({
          nom: this.bibliotheque.nom,
          adresse: this.bibliotheque.adresse,
          telephone: this.bibliotheque.telephone,
          email: this.bibliotheque.email,
          web: this.bibliotheque.web,
          description: this.bibliotheque.description,
          montantAmende: this.bibliotheque.amendeMontant,
          montantCotisation: this.bibliotheque.cotisation,
          nbLocation: this.bibliotheque.nbLocation,
          dureePret: this.bibliotheque.dureePret,
          raison: ""
        });

      }
    );
  }

  modify(){
    this.adminService.modifyBibli(this.route.snapshot.params.id, this.bibliForm.value.nom, this.bibliForm.value.adresse, this.bibliForm.value.telephone, this.bibliForm.value.email, this.bibliForm.value.web,
      this.bibliForm.value.description, this.bibliForm.value.montantAmende, this.bibliForm.value.montantCotisation, this.bibliForm.value.nbLocation, this.bibliForm.value.dureePret, this.bibliForm.value.raison).subscribe(
        response => {
          this.bibliError = response;
          document.getElementById('erreur').style.visibility = "visible";
        },
        err => {
          this.bibliError = "Impossible d'effectuer la modification avec les informations entrées";
          document.getElementById('erreur').style.visibility = "visible";
        }
      );
  }
  
  back(){
    this.location.back();
  }

}
