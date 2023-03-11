import { Controller, Get, Param } from '@nestjs/common';
import { BorrowerService } from './borrower.service';

@Controller('borrower')
export class BorrowerController { 
    constructor(private borrower: BorrowerService) {}

    @Get('/:borrower_id')
    getBorrowerId(@Param('borrower_id') id){
        return this.borrower.getBorrowerDetailById(id)
    }
}
