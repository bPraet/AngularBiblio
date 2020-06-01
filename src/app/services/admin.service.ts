import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from '../app.constants';

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  constructor(private http: HttpClient) { }

  getBibliotheques(){
    return this.http.get(`${API_URL}/admin/bibliotheques`);
  }

  getBibliotheque(id){
    return this.http.get(`${API_URL}/admin/bibliotheque/${id}`);
  }

  modifyBibli(id, nom, adresse, tel, email, web, description, amende, cotisation, nbLoc, dureePret, raison){
    return this.http.post(`${API_URL}/admin/bibliotheque/${id}/update`, {},
    {
      responseType: 'text',
      params : {
        'nom' : nom,
        'adresse' : adresse,
        'tel' : tel,
        'email' : email,
        'web' : web,
        'description' : description,
        'amende' : amende,
        'cotisation' : cotisation,
        'nbLoc' : nbLoc,
        'dureePret' : dureePret,
        'raison' : raison
      }
    });
  }
  
  addBibli(nom, adresse, tel, email, web, description, amende, cotisation, nbLoc, dureePret){
    return this.http.post(`${API_URL}/admin/bibliotheque/add`, {},
    {
      responseType: 'text',
      params : {
        'nom' : nom,
        'adresse' : adresse,
        'tel' : tel,
        'email' : email,
        'web' : web,
        'description' : description,
        'amende' : amende,
        'cotisation' : cotisation,
        'nbLoc' : nbLoc,
        'dureePret' : dureePret,
      }
    });
  }

  deleteBibli(id){
    return this.http.post(`${API_URL}/admin/bibliotheque/${id}/remove`, {},
    {
      responseType: 'text'
    });
  }
}
