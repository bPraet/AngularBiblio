import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LivreAdminAddComponent } from './livre-admin-add.component';

describe('LivreAdminAddComponent', () => {
  let component: LivreAdminAddComponent;
  let fixture: ComponentFixture<LivreAdminAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LivreAdminAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LivreAdminAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
