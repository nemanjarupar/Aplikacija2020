import { Controller, Get } from '@nestjs/common';
import { AdministratorService } from './administrator/administrator.service';
import { Administrator } from 'entities/administrator.entity';

@Controller()
export class AppController {
    constructor(
      private administratorService: AdministratorService
    ) { }


  @Get() // http://localhost:3000/
  getIndex(): string {
    return 'Home Page!';
  }

  @Get('api/administrator') // http://localhost:3000/api/administrator/
  getAllAdmins(): Promise<Administrator[]> {
    return this.administratorService.getAll();  

  }

}
