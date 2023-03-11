import { Body, Controller, Post } from '@nestjs/common';
import { ApplicationService } from './application.service';
import { ApplicationDto } from './dto/application.dto';

@Controller('application')
export class ApplicationController {
    constructor(private applicationService: ApplicationService){}

    @Post('applications')
    submitApplication(@Body() dto: ApplicationDto){
        return this.applicationService.submitApplication(dto);
    }
}
