using MaintenanceService as service from '../../srv/service';


// ============================================================
// ASSETS
// ============================================================

annotate service.Assets with @(

    // --------------------------------------------------------
    // Header Information
    // --------------------------------------------------------

    UI.HeaderInfo : {

        TypeName : 'Asset',

        TypeNamePlural : 'Assets',

        Title : {
            $Type : 'UI.DataField',
            Value : name
        },

        Description : {
            $Type : 'UI.DataField',
            Value : category
        }

    },


    // --------------------------------------------------------
    // Filter Fields
    // --------------------------------------------------------

    UI.SelectionFields : [

        name,
        category,
        location

    ],


    // --------------------------------------------------------
    // Asset List Report
    // --------------------------------------------------------

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name
        },

        {
            $Type : 'UI.DataField',
            Label : 'Category',
            Value : category
        },

        {
            $Type : 'UI.DataField',
            Label : 'Location',
            Value : location
        },

        {
            $Type : 'UI.DataField',
            Label : 'Maintenance Frequency',
            Value : maintenanceFreq
        }

    ],


    // --------------------------------------------------------
    // General Information
    // --------------------------------------------------------

    UI.FieldGroup #GeneralInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : name
            },

            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : category
            },

            {
                $Type : 'UI.DataField',
                Label : 'Location',
                Value : location
            },

            {
                $Type : 'UI.DataField',
                Label : 'Maintenance Frequency',
                Value : maintenanceFreq
            }

        ]

    },


    // --------------------------------------------------------
    // Asset Object Page Sections
    // --------------------------------------------------------

    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',

            ID : 'GeneralInformation',

            Label : 'General Information',

            Target : '@UI.FieldGroup#GeneralInformation'

        },

        {
            $Type : 'UI.ReferenceFacet',

            ID : 'MaintenanceRequests',

            Label : 'Maintenance Requests',

            Target : 'maintenanceRequests/@UI.LineItem'

        }

    ],


    // --------------------------------------------------------
    // Schedule Maintenance Action
    // --------------------------------------------------------

    UI.Identification : [

        {
            $Type : 'UI.DataFieldForAction',

            Label : 'Schedule Maintenance',

            Action : 'MaintenanceService.scheduleMaintenance'

        }

    ]

);


// ============================================================
// MAINTENANCE REQUESTS INSIDE ASSET OBJECT PAGE
// ============================================================

annotate service.Assets.maintenanceRequests with @(

    UI.LineItem : [

        {
            $Type : 'UI.DataField',

            Label : 'Title',

            Value : title

        },

        {
            $Type : 'UI.DataField',

            Label : 'Description',

            Value : description

        },

        {
            $Type : 'UI.DataField',

            Label : 'Status',

            Value : status

        },

        {
            $Type : 'UI.DataField',

            Label : 'Scheduled Date',

            Value : scheduledDate

        },

        {
            $Type : 'UI.DataField',

            Label : 'Completed Date',

            Value : completedDate

        }

    ]

);


// ============================================================
// TECHNICIANS
// ============================================================

annotate service.Technicians with @(

    UI.HeaderInfo : {

        TypeName : 'Technician',

        TypeNamePlural : 'Technicians',

        Title : {

            $Type : 'UI.DataField',

            Value : name

        },

        Description : {

            $Type : 'UI.DataField',

            Value : specialization

        }

    },


    UI.LineItem : [

        {

            $Type : 'UI.DataField',

            Label : 'Name',

            Value : name

        },

        {

            $Type : 'UI.DataField',

            Label : 'Email',

            Value : email

        },

        {

            $Type : 'UI.DataField',

            Label : 'Specialization',

            Value : specialization

        }

    ]

);


// ============================================================
// MAINTENANCE REQUESTS
// ============================================================

annotate service.MaintenanceRequests with @(

    UI.HeaderInfo : {

        TypeName : 'Maintenance Request',

        TypeNamePlural : 'Maintenance Requests',

        Title : {

            $Type : 'UI.DataField',

            Value : title

        },

        Description : {

            $Type : 'UI.DataField',

            Value : status

        }

    },


    UI.SelectionFields : [

        title,

        status,

        scheduledDate

    ],


    UI.LineItem : [

        {

            $Type : 'UI.DataField',

            Label : 'Title',

            Value : title

        },

        {

            $Type : 'UI.DataField',

            Label : 'Description',

            Value : description

        },

        {

            $Type : 'UI.DataField',

            Label : 'Status',

            Value : status

        },

        {

            $Type : 'UI.DataField',

            Label : 'Scheduled Date',

            Value : scheduledDate

        },

        {

            $Type : 'UI.DataField',

            Label : 'Completed Date',

            Value : completedDate

        }

    ],


    // --------------------------------------------------------
    // Maintenance Request Details
    // --------------------------------------------------------

    UI.FieldGroup #RequestInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {

                $Type : 'UI.DataField',

                Label : 'Title',

                Value : title

            },

            {

                $Type : 'UI.DataField',

                Label : 'Description',

                Value : description

            },

            {

                $Type : 'UI.DataField',

                Label : 'Status',

                Value : status

            },

            {

                $Type : 'UI.DataField',

                Label : 'Scheduled Date',

                Value : scheduledDate

            },

            {

                $Type : 'UI.DataField',

                Label : 'Completed Date',

                Value : completedDate

            }

        ]

    },


    UI.Facets : [

        {

            $Type : 'UI.ReferenceFacet',

            ID : 'RequestInformation',

            Label : 'Request Information',

            Target : '@UI.FieldGroup#RequestInformation'

        }

    ],


    // --------------------------------------------------------
    // Complete Maintenance Action
    // --------------------------------------------------------

    UI.Identification : [

        {

            $Type : 'UI.DataFieldForAction',

            Label : 'Complete Maintenance',

            Action : 'MaintenanceService.completeMaintenance'

        }

    ]

);