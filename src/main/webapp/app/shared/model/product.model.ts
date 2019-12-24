export interface IProduct {
  id?: number;
  code?: string;
  name?: string;
  description?: string;
  unit?: number;
  price?: number;
}

export class Product implements IProduct {
  constructor(
    public id?: number,
    public code?: string,
    public name?: string,
    public description?: string,
    public unit?: number,
    public price?: number
  ) {}
}
