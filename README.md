# Bibliotheque
Projet angular 3ème année Bachelier informatique de gestion.
![alt text](https://github.com/bPraet/AngularBiblio/blob/master/accueil.png?raw=true)
<br><br><br>
## Comptes test
### Utilisateur
login : testLogin | mdp : testMdp1$
<br>
### Administrateur
login : Stimouk | mdp : test
<br><br>
## Base de données
Dump: bibliothequeDB.sql
<br><br>
## Backend API Spring
sources : Bibliotheque.zip
<br><br>
## Fonctionnalités
### Utilisateur
- Login / Logout
- Inscription
- Catalogue + livre en détail (images provenant d'une API selon l'ISBN)
- Liste des exemplaires disponibles selon le livre sélectionné et les bibliothèques cotisées
- Location
- Réservation
- Cotisation (sans paiement)
- Liste des locations
- Liste des amendes
- Liste des cotisations
- Liste des messages
- Modification du profil
<br>

### Administrateur
- Login / Logout
- Catalogue + livre en détail (images provenant d'une API selon l'ISBN)
- Modification du profil
- Liste bibliothèques
- Ajout bibliothèque
- Modification bibliothèque
- Suppression bibliothèque
- Liste livres
- Ajout livre
- Modification livre
- Liste exemplaires
- Ajout exemplaire
- Modification exemplaire
- Suppression exemplaire
- Liste locations
- Retour d'un livre
Toutes les actions des administrateurs sont enregistrées dans la base de données avec la raison mentionnée.
<br><br>
## Contrôles
Le contrôle des erreures a été fait pour toutes les fonctionnalités disponibles.

------------------------------
Les fonctionnalités manquantes sont: paiement, gestion des admins, support(messages), mettre une amende.
