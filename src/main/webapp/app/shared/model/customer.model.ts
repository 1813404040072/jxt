import { Moment } from 'moment';

export interface ICustomer {
  id?: number;
  name?: string;
  address?: string;
  phone?: string;
  sourceType?: string;
  createdDate?: Moment;
  createdBy?: number;
  modifiedDate?: Moment;
  modifiedBy?: number;
}

export class Customer implements ICustomer {
  constructor(
    public id?: number,
    public name?: string,
    public address?: string,
    public phone?: string,
    public sourceType?: string,
    public createdDate?: Moment,
    public createdBy?: number,
    public modifiedDate?: Moment,
    public modifiedBy?: number
  ) {}
}
