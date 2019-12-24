import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import './vendor';
import { JtxSharedModule } from 'app/shared/shared.module';
import { JtxCoreModule } from 'app/core/core.module';
import { JtxAppRoutingModule } from './app-routing.module';
import { JtxHomeModule } from './home/home.module';
import { JtxEntityModule } from './entities/entity.module';
// jhipster-needle-angular-add-module-import JHipster will add new module here
import { JhiMainComponent } from './layouts/main/main.component';
import { NavbarComponent } from './layouts/navbar/navbar.component';
import { FooterComponent } from './layouts/footer/footer.component';
import { PageRibbonComponent } from './layouts/profiles/page-ribbon.component';
import { ErrorComponent } from './layouts/error/error.component';

@NgModule({
  imports: [
    BrowserModule,
    JtxSharedModule,
    JtxCoreModule,
    JtxHomeModule,
    // jhipster-needle-angular-add-module JHipster will add new module here
    JtxEntityModule,
    JtxAppRoutingModule
  ],
  declarations: [JhiMainComponent, NavbarComponent, ErrorComponent, PageRibbonComponent, FooterComponent],
  bootstrap: [JhiMainComponent]
})
export class JtxAppModule {}
