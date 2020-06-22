import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BibliAdminAddComponent } from './bibli-admin-add.component';

describe('BibliAdminAddComponent', () => {
  let component: BibliAdminAddComponent;
  let fixture: ComponentFixture<BibliAdminAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BibliAdminAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BibliAdminAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
