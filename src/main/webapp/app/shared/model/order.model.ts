import { Moment } from 'moment';

export interface IOrder {
  id?: number;
  orderId?: number;
  customerId?: number;
  orderDate?: Moment;
  invoiceStatus?: number;
  net?: number;
  shippingCost?: number;
  note?: string;
  total?: number;
  createdDate?: Moment;
  createdBy?: number;
  modifiedDate?: Moment;
  modifiedBy?: number;
}

export class Order implements IOrder {
  constructor(
    public id?: number,
    public orderId?: number,
    public customerId?: number,
    public orderDate?: Moment,
    public invoiceStatus?: number,
    public net?: number,
    public shippingCost?: number,
    public note?: string,
    public total?: number,
    public createdDate?: Moment,
    public createdBy?: number,
    public modifiedDate?: Moment,
    public modifiedBy?: number
  ) {}
}
