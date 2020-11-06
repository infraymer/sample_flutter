import 'package:bibimoney/app/remote/model/office.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/office_card.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibimoney/pages/offices/offices/controllers/offices_controller.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:string_mask/string_mask.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bibimoney/extensions.dart';

class OfficesView extends GetView<OfficesController> {
  @override
  Widget build(BuildContext context) {
    final query = GetOfficesQuery();
    return Scaffold(
      backgroundColor: UiColors.background,
      appBar: AppBar(
        title: Text('Наши офисы', style: basic14),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Query(
          options: query.options(),
          builder: (QueryResult result,
              {dynamic Function(FetchMoreOptions) fetchMore,
              Future<QueryResult> Function() refetch}) {
            if (result?.isLoading ?? true)
              return Center(child: CircularProgressIndicator());
            // List<Office> offices = [];
            // if (result?.data != null) {
            //   offices = query
            //       .parse(result.data)
            //       .offices
            //       .map((e) => Office(e))
            //       .toList();
            // }

            final offices =
                result.data != null ? query.parse(result.data).offices : [];

            return ListView.builder(
              itemCount: offices.length,
              itemBuilder: (BuildContext context, int index) {
                final formatter = StringMask('+0 (000) 000-00-00');
                return OfficeCard(
                  officeAddress: offices[index].address,
                  phoneNumber: formatter.apply(offices[index].phoneNumber),
                  schedule:
                      '${offices[index].workDays ?? ''} ${offices[index].workTime}',
                  onPressedNumber: () async {
                    await launch('tel:+${offices[index].phoneNumber}');
                  },
                  onPressedBtn: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    Get.bottomSheet(Container(
                      color: Colors.white,
                      child: SafeArea(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Wrap(
                                children: <Widget>[
                                  for (var map in availableMaps)
                                    ListTile(
                                      onTap: () {
                                        final coordinates = offices[index]
                                            .coordinates['coordinates'];
                                        map.showMarker(
                                          coords: Coords(
                                            coordinates[0],
                                            coordinates[1],
                                          ),
                                          title: offices[index].address,
                                        );
                                      },
                                      title: Text(map.mapName),
                                      leading: Image(
                                        image: map.icon,
                                        height: 30.0,
                                        width: 30.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
