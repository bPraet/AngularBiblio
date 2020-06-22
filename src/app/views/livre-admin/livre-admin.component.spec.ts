import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LivreAdminComponent } from './livre-admin.component';

describe('LivreAdminComponent', () => {
  let component: LivreAdminComponent;
  let fixture: ComponentFixture<LivreAdminComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LivreAdminComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LivreAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
