import 'package:bibimoney/app/base/extensions/date_format.dart';
import 'package:bibimoney/app/remote/model/notifications.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/pages/notification/notification_detail/notification_detail_screen.dart';
import 'package:bibimoney/pages/notification/notification_list/controllers/notification_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bibimoney/extensions.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class NotificationListView extends GetView<NotificationListController> {
  @override
  Widget build(BuildContext context) {
    final subscription = NotificationsSubscription();
    return Subscription(
      options: subscription.options(),
      builder: (QueryResult result,
          {dynamic Function(FetchMoreOptions) fetchMore,
          Future<QueryResult> Function() refetch}) {
        if (result != null && result.hasException) {
          // TODO: handle exception
        }

        if (result == null || result.isLoading) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(child: CircularProgressIndicator()));
        }

        final notifications = result.data != null
            ? subscription.parse(result.data).notifications
            : [];

        return notifications.isNotEmpty
            ? DefaultNotifications(notifications: notifications)
            : EmptyNotifications();
      },
    );
  }
}

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Уведомления', style: basic14)),
      body: Center(
        child: Text('Нет уведомлений'),
      ),
    );
  }
}

class DefaultNotifications extends StatelessWidget {
  final List<NotificationMixin> notifications;

  const DefaultNotifications({
    Key key,
    this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Уведомления', style: basic14)),
      body: ListView(
        children: List.generate(
          notifications.length,
          (index) => GestureDetector(
            onTap: () {
              Get.to(NotificationDetailScreen());
            },
            child: NotificationWidget(
              // date: DateTime.now(),
              date: notifications[index].createdAt ?? DateTime.now(),
              // text:
              //     'Здравствуйте! Завтра последний день оплаты ежемесячного платежа. Если вы не внесёте оплату вам будут начислены проценты cогласно условию договора'),
              text: notifications[index].message ?? 'Пусто',
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final DateTime date;
  final String text;
  const NotificationWidget({Key key, this.date, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: UiColors.border))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(AppDateFormat.notification.format(date),
                    style: additional12),
                SizedBox(
                  height: 8,
                ),
                Text(text, style: basic14, maxLines: 3),
              ],
            ),
          ),
          SizedBox(width: 20),
          Icon(UiIcons.arrow, color: UiColors.additional, size: 20)
        ],
      ),
    );
  }
}
