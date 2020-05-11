import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { API_URL } from '../app.constants';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class LivreService {

  constructor(private http: HttpClient, private router: Router) { }

  getCatalogue(){
    return this.http.get(`${API_URL}/livres`);
  }

  getLivre(id){
    return this.http.get(`${API_URL}/livre/${id}`);
  }

  location(idExemplaire){
    return this.http.post(`${API_URL}/location`, {},
    {
      responseType: 'text',
      params : {
        'idExemplaire' : idExemplaire
      }
    }).subscribe(
      response => {
        this.router.navigate(['catalogue']);
        console.log(response);
      }
    );
  }

  reservation(idExemplaire){
    return this.http.post(`${API_URL}/reserve`, {},
    {
      responseType: 'text',
      params : {
        'idExemplaire' : idExemplaire
      }
    }).subscribe(
      response => {
        this.router.navigate(['catalogue']);
        console.log(response);
      }
    );
  }

}
