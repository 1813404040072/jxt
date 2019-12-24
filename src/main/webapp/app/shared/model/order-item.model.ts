export interface IOrderItem {
  id?: number;
  orderId?: number;
  orderDate?: number;
  productId?: number;
  quantity?: number;
  adjusted?: number;
  price?: number;
}

export class OrderItem implements IOrderItem {
  constructor(
    public id?: number,
    public orderId?: number,
    public orderDate?: number,
    public productId?: number,
    public quantity?: number,
    public adjusted?: number,
    public price?: number
  ) {}
}
