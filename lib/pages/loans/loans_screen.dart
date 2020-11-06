import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/status_widget/loan_status_widget.dart';
import 'package:bibimoney/app/view/ui/widget/status_widget/credit.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:bibimoney/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bibimoney/extensions.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscription = CreditsSubscription();
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
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final credits =
            result.data != null ? subscription.parse(result.data).credits : [];

        return credits.isNotEmpty
            ? LoansStatusScreen(credits)
            : EmptyLoansScreen();
      },
    );
  }
}

class EmptyLoansScreen extends StatelessWidget {
  const EmptyLoansScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Image.asset('assets/images/empty-loan.png'),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 48),
            child: Center(
              child: Text(
                'Вам доступны деньги на сумму до 30000000 рублей',
                style: basic16,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppAccentButton(
              text: 'К оформлению',
              onPressed: () {
                Get.toNamed(Routes.NEW_LOAN);
              })
        ]),
      ),
    );
  }
}

class LoansStatusScreen extends StatelessWidget {
  final List<CreditMixin> credits;
  LoansStatusScreen(
    this.credits, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10, 16.0, 0),
        child: ListView.builder(
            itemCount: credits.length,
            itemBuilder: (context, index) {
              return LoanStatusWidget(
                credit: credits[index],
              );
            }),
      ),
    );
  }
}
