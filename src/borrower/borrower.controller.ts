import { Controller, Get, Param, Res } from '@nestjs/common';
import { BorrowerService } from './borrower.service';

@Controller('borrower')
export class BorrowerController { 
    constructor(private borrower: BorrowerService) {}

    @Get('/:borrower_id')
    getBorrowerId(@Param('borrower_id') id){
        return this.borrower.getBorrowerDetailById(id)
    }
}
