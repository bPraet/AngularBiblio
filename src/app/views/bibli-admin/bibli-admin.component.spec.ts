import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BibliAdminComponent } from './bibli-admin.component';

describe('BibliAdminComponent', () => {
  let component: BibliAdminComponent;
  let fixture: ComponentFixture<BibliAdminComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BibliAdminComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BibliAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
