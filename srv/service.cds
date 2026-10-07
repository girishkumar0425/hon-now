using { assetmaintenance as am } from '../db/schema';

service MaintenanceService {
    entity Technicians
        as projection on am.Technician;
    entity MaintenanceRequests
        as projection on am.MaintenanceRequest
        actions {

            action completeMaintenance(
                completedDate : Date
            ) returns Boolean;

        };
    entity Assets
        as projection on am.Asset
        actions {

            action scheduleMaintenance(
                title         : String(150),
                description   : String(255),
                scheduledDate : Date,
                technicianID  : UUID
            ) returns Boolean;

        };

}