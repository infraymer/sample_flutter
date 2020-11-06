import 'package:bibimoney/api_client.dart';
import 'package:bibimoney/app/base/app_env.dart';
import 'package:bibimoney/app/cache/application_cache_data_source.dart';
import 'package:bibimoney/app/cache/user_cache_data_source.dart';
import 'package:bibimoney/app/controllers/api_controller.dart';
import 'package:bibimoney/app/controllers/controllers.dart';
import 'package:bibimoney/app/data/application/application_remote_data_source.dart';
import 'package:bibimoney/app/data/user/user_remote_data_source.dart';
import 'package:bibimoney/app/domain/update_user/update_user_interactor.dart';
import 'package:bibimoney/app/interactor/application/application_interactor.dart';
import 'package:bibimoney/app/interactor/application/user_interactor.dart';
import 'package:bibimoney/app/remote/file_remote_data_source.dart';
import 'package:bibimoney/app/remote/user/user_remote_data_source_hasura.dart';
import 'package:bibimoney/app/repository/application/application_repository.dart';
import 'package:bibimoney/app/repository/user/user_repository.dart';
import 'package:bibimoney/invest_pages/tabs_screen/injection/tabs_module.dart';
import 'package:bibimoney/pages/auth/injection/auth_module.dart';
import 'package:bibimoney/pages/autopay/injection/new_autopay_module.dart';
import 'package:bibimoney/pages/camera/injection/camera_module.dart';
import 'package:bibimoney/pages/home/injection/home_module.dart';
import 'package:bibimoney/pages/menu/injection/menu_module.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:package_info/package_info.dart';

Future<void> appModule(AppEnv appEnv) async {
  await Firebase.initializeApp();
  await DotEnv().load();

  final env = DotEnv().env;

  await Get.put(StoreController()).init();
  Get.put(ApiController(
    graphqlEndpoint: env['GRAPHQL_ENDPOINT'],
    graphqlWsEndpoint: env['GRAPHQL_WS_ENDPOINT'],
    apiBaseUrl: env['API_BASE_URL'],
    storageBaseUrl: env['STORAGE_BASE_URL'],
  ));
  await Get.put(UserController()).init();

  Get.put(ApplicationInteractor());

  // await initHiveForFlutter();

  // Get.put(ApiClient(
  //   mode: ApiClientMode.firebase,
  //   graphqlEndpoint: 'https://graphql.bibiapp.gamer-grad.ru/v1/graphql',
  //   apiBaseUrl: 'https://api.bibiapp.gamer-grad.ru',
  // ));

  // final conf = appEnv == AppEnv.prod ? ProdConfig() : DebugConfig();

  final packageInfo = await PackageInfo.fromPlatform();
  Get.put(packageInfo);

  final cameras = await availableCameras();

  Get.put(cameras);

  // Get.lazyPut<ApplicationCacheDataSource>(() => ApplicationCacheDataSource());
  // Get.lazyPut<UserRemoteDataSourceHasura>(() => UserRemoteDataSourceHasura());
  // Get.lazyPut<FileRemoteDataSource>(() => FileRemoteDataSource());
  // Get.lazyPut<UserInteractor>(() => UserInteractor(Get.find()));
  // Get.lazyPut<UserCacheDataSource>(() => UserCacheDataSource());
  // Get.lazyPut<ApplicationRemoteDataSource>(() => ApplicationRemoteDataSource());
  // Get.lazyPut<ApplicationRepository>(
  //     () => ApplicationRepository(Get.find(), Get.find(), Get.find()));
  // Get.put(ApplicationInteractor(Get.find(), Get.find() /*, Get.find()*/));
  // Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
  // Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
  // Get.lazyPut<UpdateUserInteractor>(() => UpdateUserInteractor(Get.find()));

  // Get.find<UserInteractor>().isAuth().listen((event) {
  //   if (event)
  //     ApiClient.to.getToken();
  //   else
  //     ApiClient.to.clearToken();
  // });

  menuModule();
  authModule();
  homeModule();
  newAutopayModule();
  tabsModule();
  cameraModule();
}
