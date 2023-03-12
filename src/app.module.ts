import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { PrismaModule } from './prisma/prisma.module';
import { ConfigModule } from '@nestjs/config';
import { BorrowerModule } from './borrower/borrower.module';
import { ApplicationModule } from './application/application.module';
import { BrokersModule } from './brokers/brokers.module';
@Module({
  imports: [ConfigModule.forRoot({
    isGlobal: true
  }), AuthModule, PrismaModule, BorrowerModule, ApplicationModule, BrokersModule],
})
export class AppModule {}
