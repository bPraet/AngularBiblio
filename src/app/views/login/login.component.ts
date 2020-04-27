import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private fb: FormBuilder, private authService: AuthenticationService, private router: Router) {
    if(this.authService.isUserLoggedIn()){
      this.router.navigate(['catalogue']);
    }
   }

  loginForm = this.fb.group({
    login: "",
    motDePasse: ""
  });

  ngOnInit(): void {
  }

  onSubmit(){
    this.authService.executeJWTAuthenticationService(this.loginForm.value.login, this.loginForm.value.motDePasse);
    this.authService.test();
  }

}
