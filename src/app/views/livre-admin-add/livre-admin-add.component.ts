import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AdminService } from 'src/app/services/admin.service';
import { FormBuilder } from '@angular/forms';
import { Location } from '@angular/common';

@Component({
  selector: 'app-livre-admin-add',
  templateUrl: './livre-admin-add.component.html',
  styleUrls: ['./livre-admin-add.component.css']
})
export class LivreAdminAddComponent implements OnInit {

  livreForm;
  livreError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private fb: FormBuilder, private location: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.livreForm = this.fb.group({
      nom: "",
      EAN: "",
      ISBN: "",
      edition: "",
      auteur: "",
      prix: "",
      synopsis: "",
      numerique: "",
    });
  }

  add(){
    this.adminService.addLivre(this.livreForm.value.nom, this.livreForm.value.EAN, this.livreForm.value.ISBN, this.livreForm.value.edition,
      this.livreForm.value.auteur, this.livreForm.value.prix, this.livreForm.value.synopsis, this.livreForm.value.numerique).subscribe(
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
