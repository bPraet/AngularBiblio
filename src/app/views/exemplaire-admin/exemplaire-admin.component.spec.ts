import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExemplaireAdminComponent } from './exemplaire-admin.component';

describe('ExemplaireAdminComponent', () => {
  let component: ExemplaireAdminComponent;
  let fixture: ComponentFixture<ExemplaireAdminComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExemplaireAdminComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExemplaireAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
