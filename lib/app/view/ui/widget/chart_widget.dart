/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ChartWidget(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory ChartWidget.withSampleData() {
    return new ChartWidget(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
        // By default, bar renderer will draw rounded bars with a constant
        // radius of 100.
        // To not have any rounded corners, use [NoCornerStrategy]
        // To change the radius of the bars, use [ConstCornerStrategy]
        cornerStrategy: const charts.NoCornerStrategy(),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('Январь', 10),
      new OrdinalSales('Февраль', 15),
      new OrdinalSales('Март', 20),
      new OrdinalSales('Апрель', 30),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
