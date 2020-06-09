import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './views/login/login.component';
import { CatalogueComponent } from './views/catalogue/catalogue.component';
import { InscriptionComponent } from './views/inscription/inscription.component';
import { LivreComponent } from './views/livre/livre.component';
import { ProfilComponent } from './views/profil/profil.component';
import { SupportComponent } from './views/support/support.component';
import { BibliAdminComponent } from './views/bibli-admin/bibli-admin.component';
import { BibliAdminAddComponent } from './views/bibli-admin-add/bibli-admin-add.component';
import { LivreAdminComponent } from './views/livre-admin/livre-admin.component';
import { LivreAdminAddComponent } from './views/livre-admin-add/livre-admin-add.component';
import { ExemplaireAdminAddComponent } from './views/exemplaire-admin-add/exemplaire-admin-add.component';
import { ExemplaireAdminComponent } from './views/exemplaire-admin/exemplaire-admin.component';
import { LocationAdminComponent } from './views/location-admin/location-admin.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'catalogue' },
  { path: 'login', component: LoginComponent },
  { path: 'inscription', component: InscriptionComponent},
  { path: 'catalogue', component: CatalogueComponent },
  { path: 'livre/:id', component: LivreComponent},
  { path: 'profil', component: ProfilComponent},
  { path: 'support', component: SupportComponent},
  { path: 'admin/bibli/add', component: BibliAdminAddComponent},
  { path: 'admin/bibli/:id', component: BibliAdminComponent},
  { path: 'admin/livre/add', component: LivreAdminAddComponent},
  { path: 'admin/livre/:id', component: LivreAdminComponent},
  { path: 'admin/exemplaire/add', component: ExemplaireAdminAddComponent},
  { path: 'admin/exemplaire/:id', component: ExemplaireAdminComponent},
  { path: 'admin/location/:id', component: LocationAdminComponent},
  { path: '**', redirectTo: 'catalogue'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
