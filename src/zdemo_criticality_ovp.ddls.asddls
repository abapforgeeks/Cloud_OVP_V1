@AbapCatalog.sqlViewName: 'ZOVPTESTCRI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Criticality'
define view zdemo_criticality_ovp
  as select from sflights as flights
{

      @EndUserText.label: 'Flight Code'
      @UI: {
          selectionField.position: 10,
          lineItem.position: 10
      }
  key concat(carrid, connid)                as FlightCode,

      @UI: {
          lineItem: {
              type: #AS_DATAPOINT,
              importance: #HIGH,
              position: 20
          },
          dataPoint: {
              title: 'Flight Date'
          }
      }
  key fldate                                as FlightDate,

      @UI.lineItem.position: 20
      cityto                                as Destination,

      @UI: {
          lineItem: {
              type: #AS_DATAPOINT,
              importance: #HIGH,
              position: 10
          },
          dataPoint: {
              title: 'Flight Date',
              valueFormat.numberOfFractionalDigits: 2,
              minimumValue: 0,
              maximumValue: 100,
              criticalityCalculation: {
                  improvementDirection: #MAXIMIZE,
                  deviationRangeLowValue: 25,
                  toleranceRangeLowValue: 60
              }
          }
      }
      @Semantics.quantity.unitOfMeasure: 'Percentage'
      division(seatsocc * 100, seatsmax, 2) as Occupancy,

      @Semantics.unitOfMeasure: true
      cast(' % ' as abap.unit(3))           as Percentage
}
