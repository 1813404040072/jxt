export interface ICatalog {
  id?: number;
  type?: string;
  name?: string;
}

export class Catalog implements ICatalog {
  constructor(public id?: number, public type?: string, public name?: string) {}
}
