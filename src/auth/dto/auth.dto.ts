import { IsNotEmpty, IsNumber } from "class-validator";

export class AuthDto {
    @IsNotEmpty()
    @IsNumber()
    email: string;

    @IsNotEmpty()
    password: string;
}