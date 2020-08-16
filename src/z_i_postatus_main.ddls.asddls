@AbapCatalog.sqlViewName: 'ZIPOSTATI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Po Status Main'
@Search.searchable: true
define view z_i_postatus_main as select from zpo_status_main
association[0..*] to Z_I_PO_Status as _StatusText on $projection.status = _StatusText.status {
    //zpo_status_main
    @ObjectModel.text.association: '_StatusText'
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    key status,
    _StatusText
}
