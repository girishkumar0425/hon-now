namespace assetmaintenance;

using { cuid, managed } from '@sap/cds/common';

entity Asset : cuid, managed {

    name            : String(100);
    category        : String(50);
    location        : String(100);
    maintenanceFreq : Integer;

    maintenanceRequests : Composition of many MaintenanceRequest
        on maintenanceRequests.asset = $self;
}


entity Technician : cuid, managed {

    name           : String(100);
    email          : String(100);
    specialization : String(100);

}


entity MaintenanceRequest : cuid, managed {

    title         : String(150);
    description   : String(255);
    status        : String(30) default 'OPEN';
    scheduledDate : Date;
    completedDate : Date;

    asset : Association to Asset;

    technician : Association to Technician;

}