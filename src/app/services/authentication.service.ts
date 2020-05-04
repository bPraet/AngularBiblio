import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from 'src/app/app.constants';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';

export const TOKEN = 'token';
export const AUTHENTICATED_USER = 'authenticatedUser';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(private http: HttpClient, private router: Router) { }

  inscriptionError = "";

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
          document.getElementById('erreur').style.visibility = "visible";
        }
      )
  }

  register(nom, prenom, login, mdp, email, telephone, dNaissance, adresse) : any{

    try{
      dNaissance = new Date(dNaissance).toISOString().slice(0, 10);
    } catch(error){}
    
    return this.http.post(`${API_URL}/register`, {},
    {
      params : {
        'nom' : nom,
        'prenom' : prenom, 
        'login' : login, 
        'mdp' : mdp, 
        'email' : email, 
        'telephone' : telephone,
        'dNaissance' : dNaissance, 
        'adresse' : adresse},
    });
  }
  
}