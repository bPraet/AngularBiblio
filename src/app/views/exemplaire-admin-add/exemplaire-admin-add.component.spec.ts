import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExemplaireAdminAddComponent } from './exemplaire-admin-add.component';

describe('ExemplaireAdminAddComponent', () => {
  let component: ExemplaireAdminAddComponent;
  let fixture: ComponentFixture<ExemplaireAdminAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExemplaireAdminAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExemplaireAdminAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
