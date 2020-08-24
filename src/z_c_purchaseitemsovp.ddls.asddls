@AbapCatalog.sqlViewName: 'ZCPOITEMSOVP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Items OVP'
@Metadata.allowExtensions: true
define view Z_C_PurchaseItemsOVP
  as select from Z_I_PurchaseDocItem
{
      //Z_I_PurchaseDocItem
      @ObjectModel.text.element: ['PODescription']
  key PurchaseDoc,
  @ObjectModel.text.element: ['PorductDesc']
  key PurchaseDocItem,
      _PODocument.Description                                                              as PODescription,
      PorductDesc,
      Product,
      Price,
      Currency,
      Quantity,
      Unit,
      TotalItemPrice,
      LastChangedBy,
      _PODocument.POStatus                                                                 as POStatus,
      _PODocument._POStatus._StatusText[1:language = $session.system_language].description as StatusText,
      _PODocument.Priority                                                                 as POPriority,
      _PODocument._POPriority[1:language=$session.system_language].description             as PriorityText,

      /* Associations */
      //Z_I_PurchaseDocItem
      _Currency,
      _PODocument,
      _UOM
}
where
  _PODocument.POStatus = '1';
