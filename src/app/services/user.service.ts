import { Injectable } from '@angular/core';
import { API_URL } from '../app.constants';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getProfil(){
    return this.http.get(`${API_URL}/profil`);
  }

  modifyProfil(nom, prenom, login, mdp, dNaissance, adresse, telephone, email){
    return this.http.post(`${API_URL}/setProfil`, {},
    {
      responseType: 'text',
      params : {
        'nom' : nom,
        'prenom' : prenom,
        'login' : login,
        'mdp' : mdp,
        'dNaissance' : dNaissance,
        'adresse' : adresse,
        'telephone' : telephone,
        'email' : email
      }
    }).subscribe(
      response => {
        console.log(response);
      }
    );
  }
}
