import { Component, OnInit } from '@angular/core';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { ICatalog, Catalog } from 'app/shared/model/catalog.model';
import { CatalogService } from './catalog.service';

@Component({
  selector: 'jhi-catalog-update',
  templateUrl: './catalog-update.component.html'
})
export class CatalogUpdateComponent implements OnInit {
  isSaving: boolean;

  editForm = this.fb.group({
    id: [],
    type: [null, [Validators.required]],
    name: [null, [Validators.required]]
  });

  constructor(protected catalogService: CatalogService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {}

  ngOnInit() {
    this.isSaving = false;
    this.activatedRoute.data.subscribe(({ catalog }) => {
      this.updateForm(catalog);
    });
  }

  updateForm(catalog: ICatalog) {
    this.editForm.patchValue({
      id: catalog.id,
      type: catalog.type,
      name: catalog.name
    });
  }

  previousState() {
    window.history.back();
  }

  save() {
    this.isSaving = true;
    const catalog = this.createFromForm();
    if (catalog.id !== undefined) {
      this.subscribeToSaveResponse(this.catalogService.update(catalog));
    } else {
      this.subscribeToSaveResponse(this.catalogService.create(catalog));
    }
  }

  private createFromForm(): ICatalog {
    return {
      ...new Catalog(),
      id: this.editForm.get(['id']).value,
      type: this.editForm.get(['type']).value,
      name: this.editForm.get(['name']).value
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<ICatalog>>) {
    result.subscribe(() => this.onSaveSuccess(), () => this.onSaveError());
  }

  protected onSaveSuccess() {
    this.isSaving = false;
    this.previousState();
  }

  protected onSaveError() {
    this.isSaving = false;
  }
}
