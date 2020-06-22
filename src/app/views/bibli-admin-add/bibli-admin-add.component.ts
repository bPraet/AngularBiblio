import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AdminService } from 'src/app/services/admin.service';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-bibli-admin-add',
  templateUrl: './bibli-admin-add.component.html',
  styleUrls: ['./bibli-admin-add.component.css']
})
export class BibliAdminAddComponent implements OnInit {

  bibliForm;
  bibliError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private fb: FormBuilder, private location: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.bibliForm = this.fb.group({
      nom: "",
      adresse: "",
      telephone: "",
      email: "",
      web: "",
      description: "",
      montantAmende: "",
      montantCotisation: "",
      nbLocation: "",
      dureePret: ""
    });
  }

  add(){
    this.adminService.addBibli(this.bibliForm.value.nom, this.bibliForm.value.adresse, this.bibliForm.value.telephone, this.bibliForm.value.email, this.bibliForm.value.web,
      this.bibliForm.value.description, this.bibliForm.value.montantAmende, this.bibliForm.value.montantCotisation, this.bibliForm.value.nbLocation, this.bibliForm.value.dureePret).subscribe(
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
