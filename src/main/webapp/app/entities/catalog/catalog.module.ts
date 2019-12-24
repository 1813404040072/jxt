import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { JtxSharedModule } from 'app/shared/shared.module';
import { CatalogComponent } from './catalog.component';
import { CatalogDetailComponent } from './catalog-detail.component';
import { CatalogUpdateComponent } from './catalog-update.component';
import { CatalogDeletePopupComponent, CatalogDeleteDialogComponent } from './catalog-delete-dialog.component';
import { catalogRoute, catalogPopupRoute } from './catalog.route';

const ENTITY_STATES = [...catalogRoute, ...catalogPopupRoute];

@NgModule({
  imports: [JtxSharedModule, RouterModule.forChild(ENTITY_STATES)],
  declarations: [
    CatalogComponent,
    CatalogDetailComponent,
    CatalogUpdateComponent,
    CatalogDeleteDialogComponent,
    CatalogDeletePopupComponent
  ],
  entryComponents: [CatalogDeleteDialogComponent]
})
export class JtxCatalogModule {}
