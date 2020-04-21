import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler } from '@angular/common/http';
import { AuthenticationService } from './authentication.service';

@Injectable({
  providedIn: 'root'
})
export class HttpInterceptorAuthService implements HttpInterceptor {

  constructor(private authenticationService: AuthenticationService) { }
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    const authHeaderString = this.authenticationService.getAuthenticatedToken();
    const username =  this.authenticationService.getAuthenticatedUser();
    let reqauth;



    if (authHeaderString && username) {
      console.log(authHeaderString);
      console.log(username);
      reqauth = req.clone({
        setHeaders: {
          Authorization: authHeaderString
        }
      });
      return next.handle(reqauth);
    }

    return next.handle(req);
  }
}