@AbapCatalog.sqlViewName: 'ZCPOFILTER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Filter OVP'
define view Z_C_PurchaseFilterOVP
  as select from Z_I_PurchaseDoc
{
      //Z_I_PurchaseDoc
      @UI.lineItem:[{hidden: true}]
  key PurchaseDoc,
      @UI.selectionField: [{ exclude: false,position: 10 }]
      @Consumption.valueHelpDefinition: [{entity:{ name: 'Z_I_PO_Priority',element: 'priority'}  }]
      '' as Priority,

      @UI.selectionField: [{ exclude: false,position: 20 }]
      @Consumption.valueHelpDefinition: [{entity:{ name: 'Z_I_PO_Status',element: 'status'}  }]
      '' as POStatus
}
