import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_label_widget.dart';
import 'package:bibimoney/app/view/ui/widget/gradient_button.dart';
import 'package:bibimoney/app/view/ui/widget/images_list.dart';
import 'package:bibimoney/app/view/ui/widget/slider_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';

import 'text_field.dart';


class ProductInfoWidget extends StatefulWidget {
  final dynamic data;

  const ProductInfoWidget({Key key, this.data}) : super(key: key);

  @override
  _ProductInfoWidgetState createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  dynamic get data => widget.data;

  bool withCards = true;
  bool showContent = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text('${data.name}', style: heading1),
                  ),
                  Visibility(
                    visible: !withCards,
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AccentLabelWidget(
                            value: '${data.minPrice} ₽ / тонна'),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 38.0),
                ],
              ),
              _Content(data: data),
            ],
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final dynamic data;

  const _Content({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(
          () => _Slider(
            value: data.amount.value,
            onValue: (_) {
              data.amount.value = _;
            },
            unitName: data.unit,
          ),
        ),
        SizedBox(height: 24),
        Obx(() =>
            ImagesList(images: data.selectedMaterial.value?.photos ?? [])),
        SizedBox(height: 16),
        Obx(
          () => AppGradientButton(
            onPressed: () {
              // BasketController.to.add(data.basketItem);
              Get.back();
            },
            text: 'Добавить в корзину • ${data.sumPrice.value.toStringAsFixed(0)} ₽',
          ),
        ),
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final Function(double) onValue;
  final String unitName;

  const _Slider({Key key, this.value, this.onValue, this.unitName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Количество', style: basic16),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              child: FlutterSlider(
                values: [value],
                max: 100,
                min: 1,
                handler: sliderHandler(context),
                trackBar: sliderTrackBar(context),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  onValue?.call(lowerValue);
                },
              ),
            ),
            Container(
              width: 116,
              child: AppTextField(
                enabled: false,
                controller: TextEditingController(
                  text: value.toStringAsFixed(0),
                ),
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      unitName ?? '',
                      style: TextStyle(
                        color: AppColor.textMain.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
