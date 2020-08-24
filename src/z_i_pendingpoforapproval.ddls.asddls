@AbapCatalog.sqlViewName: 'ZCPENDINGPO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Approval'
define view Z_I_PendingPOforApproval
  as select from Z_I_PurchaseDocTotalPrice
{
      //Z_I_PurchaseDocTotalPrice
  key PurchaseDoc,
      POTOtalPrice,
      case when POTOtalPrice > 1000 then
      'Pending for Approval'
      else 'No Approval Required'
      end as Approval,
      Currency,
      Description,
      CompanyCode,
      POStatus,
      Priority,
      CreatedBy,
      /* Associations */
      //Z_I_PurchaseDocTotalPrice
      _CompanyCode,
      _Currency,
      _POItems,
      _POPriority,
      _POStatus
}
