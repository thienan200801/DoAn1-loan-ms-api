import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { ApplicationService } from './application.service';
import { ApplicationDto, DrawdownEventDto } from './dto/application.dto';

@Controller('application')
export class ApplicationController {
    constructor(private applicationService: ApplicationService){}

    @Post('applications')
    submitApplication(@Body() dto: ApplicationDto){
        return this.applicationService.submitApplication(dto);
    }

    @Get('/:application_id')
    getApplicationById(@Param('application_id') id){
        return this.applicationService.getApplicationById(id);
    }

    @Post('drawdown')
    submitDrawdownEvent(@Body() dto: DrawdownEventDto){
        return this.applicationService.submitDrawdownEvent(dto);
    }
}
