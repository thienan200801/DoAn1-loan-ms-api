import { Controller, Get, Param } from '@nestjs/common';
import { BrokersService } from './brokers.service';

@Controller('brokers')
export class BrokersController {
    constructor(private BrokersService: BrokersService){}

    @Get('/:brokers_id')
    getBrokersById(@Param('brokers_id') id){
        return this.BrokersService.getBrokersById(id);
    }
}
