@AbapCatalog.sqlViewName: 'ZCPOSTPIO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Priority Status'
@Metadata.allowExtensions: true
define view Z_C_PurchaseStatusPrio
  as select from Z_I_PurchaseDoc
  association [0..*] to Z_I_PO_Status   as _Status   on $projection.POStatus = _Status.description
  association [0..*] to Z_I_PO_Priority as _Priority on $projection.Priority = _Priority.description
{
      //Z_I_PurchaseDoc
      @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDoc,
      Description,
      POStatus,
      Priority,
      @DefaultAggregation: #SUM
      cast( 1 as eam_num_orders_outstanding ) as TotalPOs,
      _Priority.description as PriorityText,
      _Status.description as StatusText,
      _Priority,
      _Status
}
