import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AdminService } from 'src/app/services/admin.service';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder } from '@angular/forms';
import { Location } from '@angular/common';

@Component({
  selector: 'app-exemplaire-admin',
  templateUrl: './exemplaire-admin.component.html',
  styleUrls: ['./exemplaire-admin.component.css']
})
export class ExemplaireAdminComponent implements OnInit {

  exemplaire;
  exemplaireForm;
  exemplaireError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private route: ActivatedRoute, private fb: FormBuilder, private location: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.adminService.getExemplaire(this.route.snapshot.params.id).subscribe(
      exemplaire => {
        console.log(exemplaire);
        this.exemplaire = exemplaire;
        this.exemplaireForm = this.fb.group({
          idEtat: this.exemplaire.etat.id,
          disponible: this.exemplaire.disponible,
          raison: ""
        });

      }
    );
  }

  modify(){
    this.adminService.modifyExemplaire(this.route.snapshot.params.id, this.exemplaireForm.value.idEtat, this.exemplaireForm.value.disponible, this.exemplaireForm.value.raison).subscribe(
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
