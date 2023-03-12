import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class BrokersService {
    constructor(private prisma: PrismaService){}

    async getBrokersById(brokerId: string){
        try {
            const broker = this.prisma.broker.findFirst({
                where: {
                    broker_id: brokerId
                },
              });
            return broker;
        } catch (error) {
            console.log(error)
            return 'Error occurs' 
        }
    }
}
