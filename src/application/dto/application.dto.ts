export class ApplicationDto {
    propAddress: string;
    propEstimateValue: string;
    loanPeriod: number;
    applicationAmount: string;
    brokerId: string;
    borrowerId: string;
}

export class DrawdownEventDto {
    application_id: number;
}