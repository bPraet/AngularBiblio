import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './views/login/login.component';
import { CatalogueComponent } from './views/catalogue/catalogue.component';
import { InscriptionComponent } from './views/inscription/inscription.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'catalogue' },
  { path: 'login', component: LoginComponent },
  { path: 'inscription', component: InscriptionComponent},
  { path: 'catalogue', component: CatalogueComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
