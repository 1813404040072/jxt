import { Component, OnInit } from '@angular/core';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { IOrderItem, OrderItem } from 'app/shared/model/order-item.model';
import { OrderItemService } from './order-item.service';

@Component({
  selector: 'jhi-order-item-update',
  templateUrl: './order-item-update.component.html'
})
export class OrderItemUpdateComponent implements OnInit {
  isSaving: boolean;

  editForm = this.fb.group({
    id: [],
    orderId: [null, [Validators.required]],
    orderDate: [null, [Validators.required]],
    productId: [null, [Validators.required]],
    quantity: [],
    adjusted: [],
    price: []
  });

  constructor(protected orderItemService: OrderItemService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {}

  ngOnInit() {
    this.isSaving = false;
    this.activatedRoute.data.subscribe(({ orderItem }) => {
      this.updateForm(orderItem);
    });
  }

  updateForm(orderItem: IOrderItem) {
    this.editForm.patchValue({
      id: orderItem.id,
      orderId: orderItem.orderId,
      orderDate: orderItem.orderDate,
      productId: orderItem.productId,
      quantity: orderItem.quantity,
      adjusted: orderItem.adjusted,
      price: orderItem.price
    });
  }

  previousState() {
    window.history.back();
  }

  save() {
    this.isSaving = true;
    const orderItem = this.createFromForm();
    if (orderItem.id !== undefined) {
      this.subscribeToSaveResponse(this.orderItemService.update(orderItem));
    } else {
      this.subscribeToSaveResponse(this.orderItemService.create(orderItem));
    }
  }

  private createFromForm(): IOrderItem {
    return {
      ...new OrderItem(),
      id: this.editForm.get(['id']).value,
      orderId: this.editForm.get(['orderId']).value,
      orderDate: this.editForm.get(['orderDate']).value,
      productId: this.editForm.get(['productId']).value,
      quantity: this.editForm.get(['quantity']).value,
      adjusted: this.editForm.get(['adjusted']).value,
      price: this.editForm.get(['price']).value
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IOrderItem>>) {
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
