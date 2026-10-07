const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

    const {
        Assets,
        MaintenanceRequests
    } = this.entities;

    this.on('scheduleMaintenance', async (req) => {
        const {
            title,
            description,
            scheduledDate,
            technicianID
        } = req.data;
        const assetID = req.params[0].ID;

        if (!title) {
            return req.error(
                400,
                'Title is required'
            );
        }
        if (!scheduledDate) {
            return req.error(
                400,
                'Scheduled Date is required'
            );
        }
        if (!technicianID) {
            return req.error(
                400,
                'Technician ID is required'
            );
        }
        const asset = await SELECT.one
            .from(Assets)
            .where({
                ID: assetID
            });
        if (!asset) {

            return req.error(
                404,
                'Asset not found'
            );

        }
        const technician = await SELECT.one
            .from('assetmaintenance.Technician')
            .where({
                ID: technicianID
            });
        if (!technician) {

            return req.error(
                404,
                'Technician not found'
            );

        }
        await INSERT
            .into(MaintenanceRequests)
            .entries({

                ID: cds.utils.uuid(),

                title: title,

                description: description,

                status: 'SCHEDULED',

                scheduledDate: scheduledDate,

                asset_ID: assetID,

                technician_ID: technicianID

            });
        return true;
    });
    this.on('completeMaintenance', async (req) => {

        const {
            completedDate
        } = req.data;
        const requestID = req.params[0].ID;
        if (!completedDate) {

            return req.error(
                400,
                'Completed Date is required'
            );
        }
        const request = await SELECT.one
            .from(MaintenanceRequests)
            .where({
                ID: requestID
            });
        if (!request) {

            return req.error(
                404,
                'Maintenance request not found'
            );
        }
        await UPDATE(MaintenanceRequests)
            .set({

                status: 'COMPLETED',

                completedDate: completedDate

            })
            .where({

                ID: requestID

            });


        return true;

    });

});const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

    const {
        Assets,
        MaintenanceRequests
    } = this.entities;

    this.on('scheduleMaintenance', async (req) => {

        const {
            title,
            description,
            scheduledDate,
            technicianID
        } = req.data;
        const assetID = req.params[0].ID;

        if (!title) {
            return req.error(
                400,
                'Title is required'
            );
        }


        if (!scheduledDate) {
            return req.error(
                400,
                'Scheduled Date is required'
            );
        }


        if (!technicianID) {
            return req.error(
                400,
                'Technician ID is required'
            );
        }
        const asset = await SELECT.one
            .from(Assets)
            .where({
                ID: assetID
            });


        if (!asset) {

            return req.error(
                404,
                'Asset not found'
            );

        }

        const technician = await SELECT.one
            .from('assetmaintenance.Technician')
            .where({
                ID: technicianID
            });


        if (!technician) {

            return req.error(
                404,
                'Technician not found'
            );

        }

        await INSERT
            .into(MaintenanceRequests)
            .entries({

                ID: cds.utils.uuid(),

                title: title,

                description: description,

                status: 'SCHEDULED',

                scheduledDate: scheduledDate,

                asset_ID: assetID,

                technician_ID: technicianID

            });


        return true;

    });

    this.on('completeMaintenance', async (req) => {

        const {
            completedDate
        } = req.data;


        // Get selected Maintenance Request ID
        const requestID = req.params[0].ID;

        if (!completedDate) {

            return req.error(
                400,
                'Completed Date is required'
            );

        }

        const request = await SELECT.one
            .from(MaintenanceRequests)
            .where({
                ID: requestID
            });


        if (!request) {

            return req.error(
                404,
                'Maintenance request not found'
            );

        }
        await UPDATE(MaintenanceRequests)
            .set({

                status: 'COMPLETED',

                completedDate: completedDate

            })
            .where({

                ID: requestID

            });


        return true;

    });

});