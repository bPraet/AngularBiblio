import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AdminService } from 'src/app/services/admin.service';
import { FormBuilder } from '@angular/forms';
import { Location } from '@angular/common';

@Component({
  selector: 'app-exemplaire-admin-add',
  templateUrl: './exemplaire-admin-add.component.html',
  styleUrls: ['./exemplaire-admin-add.component.css']
})
export class ExemplaireAdminAddComponent implements OnInit {

  exemplaireForm;
  exemplaireError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private fb: FormBuilder, private location: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.exemplaireForm = this.fb.group({
      idEtat: "",
      idLivre: "",
      idBibliotheque: ""
    });
  }

  add(){
    this.adminService.addExemplaire(this.exemplaireForm.value.idEtat, this.exemplaireForm.value.idLivre, this.exemplaireForm.value.idBibliotheque).subscribe(
        response => {
          this.exemplaireError = response;
          document.getElementById('erreur').style.visibility = "visible";
        },
        err => {
          this.exemplaireError = "Impossible d'effectuer la modification avec les informations entrées";
          document.getElementById('erreur').style.visibility = "visible";
        }
      );
  }

  back(){
    this.location.back();
  }
}
