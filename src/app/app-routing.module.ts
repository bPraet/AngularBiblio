import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './views/login/login.component';
import { CatalogueComponent } from './views/catalogue/catalogue.component';
import { InscriptionComponent } from './views/inscription/inscription.component';
import { LivreComponent } from './views/livre/livre.component';
import { ProfilComponent } from './views/profil/profil.component';
import { SupportComponent } from './views/support/support.component';
import { BibliAdminComponent } from './views/bibli-admin/bibli-admin.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'catalogue' },
  { path: 'login', component: LoginComponent },
  { path: 'inscription', component: InscriptionComponent},
  { path: 'catalogue', component: CatalogueComponent },
  { path: 'livre/:id', component: LivreComponent},
  { path: 'profil', component: ProfilComponent},
  { path: 'support', component: SupportComponent},
  { path: 'admin/bibli/:id', component: BibliAdminComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
