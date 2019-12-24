export interface IAddress {
  id?: number;
  customerId?: number;
  address?: string;
  phone?: string;
  email?: string;
}

export class Address implements IAddress {
  constructor(public id?: number, public customerId?: number, public address?: string, public phone?: string, public email?: string) {}
}
