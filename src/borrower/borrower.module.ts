import { Module } from '@nestjs/common';
import { BorrowerController } from './borrower.controller';
import { BorrowerService } from './borrower.service';

@Module({
  controllers: [BorrowerController],
  providers: [BorrowerService]
})
export class BorrowerModule {}
