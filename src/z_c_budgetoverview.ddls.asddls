@AbapCatalog.sqlViewName: 'ZPOBUDGET'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Budget'
@Metadata.allowExtensions: true

define view z_c_BudgetOverview
  as select from Z_I_PurchaseDocTotalPrice
{
      //Z_I_PurchaseDocTotalPrice
      @Consumption.semanticObject: 'PurchasingDocument'
      @ObjectModel.text.element: ['Description']
  key PurchaseDoc,
      POTOtalPrice,
      Currency,
      Description,
      CompanyCode,
      CreatedBy,
      CreateTimeDate,

      @Semantics.quantity.unitOfMeasure: 'Percentage'
      cast( division(POTOtalPrice * 100, 10000, 0) as abap.int2 ) as BudgentUsage,
      @Semantics.unitOfMeasure: true
      cast( ' % ' as abap.unit( 3 ))         as Percentage
      /* Associations */
      //Z_I_PurchaseDocTotalPrice
}
