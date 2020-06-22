import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AdminService } from 'src/app/services/admin.service';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder } from '@angular/forms';
import { Location } from '@angular/common';

@Component({
  selector: 'app-location-admin',
  templateUrl: './location-admin.component.html',
  styleUrls: ['./location-admin.component.css']
})
export class LocationAdminComponent implements OnInit {

  location;
  locationForm;
  locationError = "";

  constructor(private authService: AuthenticationService, private adminService: AdminService, private route: ActivatedRoute, private fb: FormBuilder, private loc: Location) { 
    this.authService.isAdmin();
  }

  ngOnInit(): void {
    this.adminService.getLocation(this.route.snapshot.params.id).subscribe(
      location => {
        this.location = location;
        this.locationForm = this.fb.group({
          dateRetour: ""
        });
      }
    );
  }

  modify(){
    this.adminService.modifyLocation(this.route.snapshot.params.id, this.locationForm.value.dateRetour).subscribe(
        response => {
          this.locationError = response;
          document.getElementById('erreur').style.visibility = "visible";
        },
        err => {
          this.locationError = "Impossible d'effectuer la modification avec les informations entrées";
          document.getElementById('erreur').style.visibility = "visible";
        }
      );
  }

  back(){
    this.loc.back();
  }
}
