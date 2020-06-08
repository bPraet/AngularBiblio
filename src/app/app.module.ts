import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { HttpInterceptorAuthService } from './services/http-interceptor-auth.service';
import { LoginComponent } from './views/login/login.component';
import { ReactiveFormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatButtonModule } from '@angular/material/button';
import { CatalogueComponent } from './views/catalogue/catalogue.component';
import { MatCardModule } from '@angular/material/card';
import { InscriptionComponent } from './views/inscription/inscription.component';
import { LivreComponent } from './views/livre/livre.component';
import { MatExpansionModule } from '@angular/material/expansion';
import { ProfilComponent } from './views/profil/profil.component';
import { SupportComponent } from './views/support/support.component';
import { AdminComponent } from './views/admin/admin.component';
import { BibliAdminComponent } from './views/bibli-admin/bibli-admin.component';
import { BibliAdminAddComponent } from './views/bibli-admin-add/bibli-admin-add.component';
import { LivreAdminComponent } from './views/livre-admin/livre-admin.component';
import { LivreAdminAddComponent } from './views/livre-admin-add/livre-admin-add.component';
import {MatRadioModule} from '@angular/material/radio';
import { ExemplaireAdminComponent } from './views/exemplaire-admin/exemplaire-admin.component';
import { ExemplaireAdminAddComponent } from './views/exemplaire-admin-add/exemplaire-admin-add.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    CatalogueComponent,
    InscriptionComponent,
    LivreComponent,
    ProfilComponent,
    SupportComponent,
    AdminComponent,
    BibliAdminComponent,
    BibliAdminAddComponent,
    LivreAdminComponent,
    LivreAdminAddComponent,
    ExemplaireAdminComponent,
    ExemplaireAdminAddComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    MatInputModule,
    MatFormFieldModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatCardModule,
    MatExpansionModule,
    MatRadioModule
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: HttpInterceptorAuthService,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
