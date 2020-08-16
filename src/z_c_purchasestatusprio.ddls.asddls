@AbapCatalog.sqlViewName: 'ZCPOSTPIO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Priority Status'
@Metadata.allowExtensions: true
define view Z_C_PurchaseStatusPrio
  as select from Z_I_PurchaseDoc
  association [0..1] to z_i_postatus_main as _Status   on $projection.POStatus = _Status.status
  association [0..*] to Z_I_PO_Priority   as _Priority on $projection.Priority = _Priority.priority
{
      //Z_I_PurchaseDoc
      @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDoc,
      Description,
      POStatus,
      Priority,
      @DefaultAggregation: #SUM
      cast( 1 as eam_num_orders_outstanding ) as TotalPOs,
      _Priority[1:language = $session.system_language].description                   as PriorityText,
      _Status._StatusText[1:language = $session.system_language].description         as StatusText,
      _Priority,
      _Status
}
