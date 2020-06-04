import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AdminService } from 'src/app/services/admin.service';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder } from '@angular/forms';
import { Location } from '@angular/common';

@Component({
  selector: 'app-livre-admin',
  templateUrl: './livre-admin.component.html',
  styleUrls: ['./livre-admin.component.css']
})
export class LivreAdminComponent implements OnInit {

  livre;
  livreForm;
  livreError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private route: ActivatedRoute, private fb: FormBuilder, private location: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.adminService.getLivre(this.route.snapshot.params.id).subscribe(
      livre => {
        this.livre = livre;
        console.log(livre);
        this.livreForm = this.fb.group({
          nom: this.livre.nom,
          EAN: this.livre.ean,
          ISBN: this.livre.isbn,
          edition: this.livre.edition,
          auteur: this.livre.auteur,
          prix: this.livre.prix,
          synopsis: this.livre.synopsis,
          numerique: this.livre.numerique,
          raison: ""
        });

      }
    );
  }
  
  modify(){
    this.adminService.modifyLivre(this.route.snapshot.params.id, this.livreForm.value.nom, this.livreForm.value.EAN, this.livreForm.value.ISBN, this.livreForm.value.edition,
      this.livreForm.value.auteur, this.livreForm.value.prix, this.livreForm.value.synopsis, this.livreForm.value.numerique, this.livreForm.value.raison).subscribe(
        response => {
          this.livreError = response;
          document.getElementById('erreur').style.visibility = "visible";
        },
        err => {
          this.livreError = "Impossible d'effectuer la modification avec les informations entrées";
          document.getElementById('erreur').style.visibility = "visible";
        }
      );
  }
  
  back(){
    this.location.back();
  }

}
