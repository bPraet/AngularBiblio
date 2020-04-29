import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from 'src/app/app.constants';
import { Router } from '@angular/router';

export const TOKEN = 'token';
export const AUTHENTICATED_USER = 'authenticatedUser';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(private http: HttpClient, private router: Router) { }
  getAuthenticatedUser() {
    return sessionStorage.getItem(AUTHENTICATED_USER);
  }
  getAuthenticatedToken() {
    return sessionStorage.getItem(TOKEN);
  }

  isUserLoggedIn() {
    const user = sessionStorage.getItem(AUTHENTICATED_USER);
    return !(user === null);
  }
  logout() {
    sessionStorage.removeItem(AUTHENTICATED_USER);
    sessionStorage.removeItem(TOKEN);
  }

  executeJWTAuthenticationService(username, password) {
    this.http.post<any>(`${API_URL}/authenticate`, {username, password}).subscribe(
        data => {
          sessionStorage.setItem(AUTHENTICATED_USER, username);
          sessionStorage.setItem(TOKEN, `Bearer ${data.token}`);
          this.router.navigate(['catalogue']);
        },
        error => {
          console.log("identifiants invalides");
          document.getElementById('erreur').style.visibility = "visible";
        }
      )
  }
}