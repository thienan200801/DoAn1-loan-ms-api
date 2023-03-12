import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { ApplicationDto, DrawdownEventDto } from './dto/application.dto';

@Injectable()
export class ApplicationService {
    constructor(private prisma: PrismaService){}

    async submitApplication(dto: ApplicationDto){
        try{
            const application = await this.prisma.application.create({
                data: {
                    created_date: new Date(),
                    settlement_date: new Date(),
                    drawdown_date: new Date(),
                    status: '',
                    offset_account_id: '',
                    prop_address: dto.propAddress,
                    prop_estimated_value: dto.propEstimateValue,
                    loan_period: dto.loanPeriod,
                    application_amount: dto.applicationAmount,
                    broker_id: dto.brokerId,
                    borrower_id: dto.borrowerId
                }
            })
            return application
        }catch (error){
            console.log(error)
            return 'Error occurs'
        }
    }

    async getApplicationById(applicationId: string){
        try {
            const application = this.prisma.application.findFirst({
                where: {
                    application_id: parseInt(applicationId)
                },
              });
            return application;
        } catch (error) {
            console.log(error)
            return 'Error occurs' 
        }
    }

    async submitDrawdownEvent(dto: DrawdownEventDto){
        try{
            const application = await this.prisma.application.create({
                data: {
                    created_date: new Date(),
                    settlement_date: new Date(),
                    drawdown_date: new Date(),
                    status: '',
                    offset_account_id: '',
                    prop_address: '',
                    prop_estimated_value: '',
                    loan_period: 2023,
                    application_amount: 10000,
                    broker_id: "11111",
                    borrower_id: "15777"
                },
            });
            return application.application_id
        }catch (error){
            console.log(error)
            return 'Error occurs'
        }
    }
}
