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

  getLivres(){
    return this.http.get(`${API_URL}/admin/livres`);
  }

  getLivre(id){
    return this.http.get(`${API_URL}/admin/livre/${id}`);
  }

  modifyLivre(id, nom, EAN, ISBN, edition, auteur, prix, synopsis, numerique, raison){
    return this.http.post(`${API_URL}/admin/livre/${id}/update`, {},
    {
      responseType: 'text',
      params : {
        'nom' : nom,
        'EAN' : EAN,
        'ISBN' : ISBN,
        'edition' : edition,
        'auteur' : auteur,
        'prix' : prix,
        'synopsis' : synopsis,
        'numerique' : numerique,
        'raison' : raison
      }
    });
  }

  addLivre(nom, EAN, ISBN, edition, auteur, prix, synopsis, numerique){
    return this.http.post(`${API_URL}/admin/livre/add`, {},
    {
      responseType: 'text',
      params : {
        'nom' : nom,
        'EAN' : EAN,
        'ISBN' : ISBN,
        'edition' : edition,
        'auteur' : auteur,
        'prix' : prix,
        'synopsis' : synopsis,
        'numerique' : numerique,
      }
    });
  }

  getExemplaires(){
    return this.http.get(`${API_URL}/admin/exemplaires`);
  }

  getExemplaire(id){
    return this.http.get(`${API_URL}/admin/exemplaire/${id}`);
  }

  modifyExemplaire(id, idEtat, disponible, raison){
    return this.http.post(`${API_URL}/admin/exemplaire/${id}/update`, {},
    {
      responseType: 'text',
      params : {
        'idEtat' : idEtat,
        'disponible' : disponible,
        'raison' : raison
      }
    });
  }

  addExemplaire(idEtat, idLivre, idBibliotheque){
    return this.http.post(`${API_URL}/admin/exemplaire/add`, {},
    {
      responseType: 'text',
      params : {
        'idEtat' : idEtat,
        'idLivre' : idLivre,
        'idBibliotheque' : idBibliotheque
      }
    });
  }

  deleteExemplaire(id){
    return this.http.post(`${API_URL}/admin/exemplaire/${id}/remove`, {},
    {
      responseType: 'text'
    });
  }

  getLocations(){
    return this.http.get(`${API_URL}/admin/locations`);
  }

  getLocation(id){
    return this.http.get(`${API_URL}/admin/location/${id}`);
  }

  modifyLocation(id, dateRetour){
    return this.http.post(`${API_URL}/admin/location/${id}/update`, {},
    {
      responseType: 'text',
      params : {
        'dateRetour': dateRetour
      }
    });
  }
}
