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

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    CatalogueComponent,
    InscriptionComponent,
    LivreComponent
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
    MatExpansionModule
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: HttpInterceptorAuthService,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
