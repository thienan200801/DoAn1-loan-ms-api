import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class BorrowerService {
    constructor(private prisma: PrismaService){}

    async getBorrowerDetailById(borrowerId: string){
        try{
            const borrowerDetail = this.prisma.borrower.findFirst({
                where: {
                    borrower_id: borrowerId
                },
              });
            return borrowerDetail;
        } catch (error){
            console.log(error)
            return 'Error occurs'
        }
    }

}
