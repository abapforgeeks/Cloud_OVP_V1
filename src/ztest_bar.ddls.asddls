@AbapCatalog.sqlViewName: 'ZTESTBAR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'test'
@Metadata.allowExtensions: true
define view ztest_bar as select from t001k {
    key bukrs as com_code,
    key count(*) as tot_plants
}group by bukrs
