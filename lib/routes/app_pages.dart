import 'package:bibimoney/pages/offices/offices/views/offices_view.dart';
import 'package:bibimoney/pages/offices/offices/bindings/offices_binding.dart';
import 'package:bibimoney/pages/notification/notification_list/views/notification_list_view.dart';
import 'package:bibimoney/pages/notification/notification_list/bindings/notification_list_binding.dart';
import 'package:bibimoney/invest_pages/password_send/views/password_send_view.dart';
import 'package:bibimoney/invest_pages/password_send/bindings/password_send_binding.dart';
import 'package:bibimoney/invest_pages/authorization/bindings/authorization_binding.dart';
import 'package:bibimoney/invest_pages/authorization/views/authorization_view.dart';
import 'package:bibimoney/invest_pages/new_participant/bindings/new_participant_binding.dart';
import 'package:bibimoney/invest_pages/new_participant/views/new_participant_view.dart';
import 'package:bibimoney/invest_pages/password_recovery/bindings/password_recovery_binding.dart';
import 'package:bibimoney/invest_pages/password_recovery/views/password_recovery_view.dart';
import 'package:bibimoney/invest_pages/profile/bindings/profile_binding.dart';
import 'package:bibimoney/invest_pages/profile/views/profile_view.dart';
import 'package:bibimoney/invest_pages/root_invest/bindings/root_invest_binding.dart';
import 'package:bibimoney/invest_pages/root_invest/views/root_invest_view.dart';
import 'package:bibimoney/pages/new_loan/additional_contacts/additional_contacts_binding.dart';
import 'package:bibimoney/pages/new_loan/additional_contacts/additional_contacts_view.dart';
import 'package:bibimoney/pages/new_loan/auto_data/auto_data_binding.dart';
import 'package:bibimoney/pages/new_loan/auto_data/auto_data_view.dart';
import 'package:bibimoney/pages/new_loan/check_info_loan/check_info_loan_binding.dart';
import 'package:bibimoney/pages/new_loan/check_info_loan/check_info_loan_view.dart';
import 'package:bibimoney/pages/new_loan/info_about_you/info_about_you_binding.dart';
import 'package:bibimoney/pages/new_loan/info_about_you/info_about_you_view.dart';
import 'package:bibimoney/pages/new_loan/passport_data/passport_data_binding.dart';
import 'package:bibimoney/pages/new_loan/passport_data/passport_data_view.dart';
import 'package:bibimoney/pages/new_loan/photo_and_video_auto/photo_and_video_auto_view.dart';
import 'package:bibimoney/pages/new_loan/photo_and_video_auto/photo_and_video_auto_binding.dart';
import 'package:bibimoney/pages/new_loan/add_card/add_card_view.dart';
import 'package:bibimoney/pages/new_loan/add_card/add_card_binding.dart';
import 'package:bibimoney/pages/new_loan/new_loan/new_loan_view.dart';
import 'package:bibimoney/pages/new_loan/new_loan/new_loan_binding.dart';
import 'package:bibimoney/pages/new_loan/reciving_money/reciving_money_binding.dart';
import 'package:bibimoney/pages/new_loan/reciving_money/reciving_money_view.dart';
import 'package:bibimoney/pages/root/root_view.dart';
import 'package:bibimoney/pages/root/root_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
// static const INITIAL = Routes.HOME;

  static final routes = [
    // GetPage(
    //   name: Routes.SPLASH_SCREEN,
    //   page:()=> SplashScreenView(),
    //   binding: SplashScreenBinding(),
    // ),
    GetPage(
      name: Routes.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.NEW_LOAN,
      page: () => NewLoanView(),
      binding: NewLoanBinding(),
    ),
    GetPage(
      name: Routes.ADD_CARD,
      page: () => AddCardView(),
      binding: AddCardBinding(),
    ),
    GetPage(
      name: Routes.ADDITIONAL_CONTACTS,
      page: () => AdditionalContactsView(),
      binding: AdditionalContactsBinding(),
    ),
    GetPage(
      name: Routes.AUTO_DATA,
      page: () => AutoDataView(),
      binding: AutoDataBinding(),
    ),
    GetPage(
      name: Routes.CHECK_INFO_LOAN,
      page: () => CheckInfoLoanView(),
      binding: CheckInfoLoanBinding(),
    ),
    GetPage(
      name: Routes.INFO_ABOUT_YOU,
      page: () => InfoAboutYouView(),
      binding: InfoAboutYouBinding(),
    ),
    GetPage(
      name: Routes.PASSPORT_DATA,
      page: () => PassportDataView(),
      binding: PassportDataBinding(),
    ),
    GetPage(
      name: Routes.PHOTO_AND_VIDEO_AUTO,
      page: () => PhotoAndVideoAutoView(),
      binding: PhotoAndVideoAutoBinding(),
    ),
    GetPage(
      name: Routes.RECIVING_MONEY,
      page: () => RecivingMoneyView(),
      binding: RecivingMoneyBinding(),
    ),
    GetPage(
      name: Routes.NEW_PARTICIPANT,
      page: () => NewParticipantView(),
      binding: NewParticipantBinding(),
    ),
    GetPage(
      name: Routes.AUTHORIZATION,
      page: () => AuthorizationView(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      name: Routes.ROOT_INVEST,
      page: () => RootInvestView(),
      binding: RootInvestBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.PASSWORD_RECOVERY,
      page: () => PasswordRecoveryView(),
      binding: PasswordRecoveryBinding(),
    ),
    GetPage(
      name: Routes.PASSWORD_SEND,
      page: () => PasswordSendView(),
      binding: PasswordSendBinding(),
    ),
    GetPage(
      name: Routes.OFFICES,
      page: () => OfficesView(),
      binding: OfficesBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION_LIST,
      page: () => NotificationListView(),
      binding: NotificationListBinding(),
    ),
  ];
}
