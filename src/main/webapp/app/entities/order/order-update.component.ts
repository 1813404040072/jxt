import { Component, OnInit } from '@angular/core';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import * as moment from 'moment';
import { IOrder, Order } from 'app/shared/model/order.model';
import { OrderService } from './order.service';

@Component({
  selector: 'jhi-order-update',
  templateUrl: './order-update.component.html'
})
export class OrderUpdateComponent implements OnInit {
  isSaving: boolean;
  orderDateDp: any;
  createdDateDp: any;
  modifiedDateDp: any;

  editForm = this.fb.group({
    id: [],
    customerId: [null, [Validators.required]],
    orderDate: [],
    invoiceStatus: [],
    net: [],
    shippingCost: [],
    note: [],
    total: [],
    createdDate: [],
    createdBy: [],
    modifiedDate: [],
    modifiedBy: []
  });

  constructor(protected orderService: OrderService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {}

  ngOnInit() {
    this.isSaving = false;
    this.activatedRoute.data.subscribe(({ order }) => {
      this.updateForm(order);
    });
  }

  updateForm(order: IOrder) {
    this.editForm.patchValue({
      id: order.id,
      customerId: order.customerId,
      orderDate: order.orderDate,
      invoiceStatus: order.invoiceStatus,
      net: order.net,
      shippingCost: order.shippingCost,
      note: order.note,
      total: order.total,
      createdDate: order.createdDate,
      createdBy: order.createdBy,
      modifiedDate: order.modifiedDate,
      modifiedBy: order.modifiedBy
    });
  }

  previousState() {
    window.history.back();
  }

  save() {
    this.isSaving = true;
    const order = this.createFromForm();
    if (order.id !== undefined) {
      this.subscribeToSaveResponse(this.orderService.update(order));
    } else {
      this.subscribeToSaveResponse(this.orderService.create(order));
    }
  }

  private createFromForm(): IOrder {
    return {
      ...new Order(),
      id: this.editForm.get(['id']).value,
      customerId: this.editForm.get(['customerId']).value,
      orderDate: this.editForm.get(['orderDate']).value,
      invoiceStatus: this.editForm.get(['invoiceStatus']).value,
      net: this.editForm.get(['net']).value,
      shippingCost: this.editForm.get(['shippingCost']).value,
      note: this.editForm.get(['note']).value,
      total: this.editForm.get(['total']).value,
      createdDate: this.editForm.get(['createdDate']).value,
      createdBy: this.editForm.get(['createdBy']).value,
      modifiedDate: this.editForm.get(['modifiedDate']).value,
      modifiedBy: this.editForm.get(['modifiedBy']).value
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IOrder>>) {
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
