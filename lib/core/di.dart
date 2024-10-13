import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/data/data_source/remote_data_source_googleapis.dart';
import 'package:mvvm_project/core/common/data/network/api_place.dart';
import 'package:mvvm_project/core/common/data/repository/repositorygoogleapis_impl.dart';
import 'package:mvvm_project/core/common/domain/repository/repository_googleapis.dart';
import 'package:mvvm_project/core/common/network/dio_factory.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/common/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/feature_auth/data/data_source/remote_data_source_auth.dart';
import 'package:mvvm_project/features/feature_auth/data/network/apiAuth.dart';
import 'package:mvvm_project/features/feature_auth/data/repository/repository_impl.dart';
import 'package:mvvm_project/features/feature_auth/domain/repository/repository.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/addAddress_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/address_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/deleteAccount_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/login_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/register_use_case.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/restPassword_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/updateUser_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/userinfo_usecase.dart';
import 'package:mvvm_project/features/feature_auth/presentation/login/login_viewmodel.dart';
import 'package:mvvm_project/features/feature_more/more_viewModel.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/repository/repositoryHome_impl.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/recipe_usecase.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/features/features_wishlist/data/data_source/localDataSource_wishlist.dart';
import 'package:mvvm_project/features/features_wishlist/data/repository/repositoryWishlist_impl.dart';
import 'package:mvvm_project/features/features_wishlist/domain/repository/repository_wishlist.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/Addwishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/deleteItemwishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/isProductwishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/wishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton(() => AppPreferences(instance()));

  // networl instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ApiAuth>(() => ApiAuth(dio));
  instance.registerLazySingleton<ApiHome>(() => ApiHome(dio));
  instance.registerLazySingleton<ApiPlace>(() => ApiPlace(dio));




  // remote data source
  instance.registerLazySingleton<RemoteDataSourceAuth>(
      () => RemoteDataSourceAuthImplementer(instance()));
  instance.registerLazySingleton<RemoteDataSourceHome>(
      () => RemoteDataSourceHomeImplementer(instance()));
  instance.registerLazySingleton<RemoteDataSourcPlace>(
          () => RemoteDataSourcePlaceImplementer(instance()));


  // local data source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementer());
  instance.registerLazySingleton<LocalDataSourceWishlist>(
          () => LocalDataSourceWishlistImplementer());


  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
  instance.registerLazySingleton<RepositoryHome>(
      () => RepositoryHomeImpl(instance(), instance(), instance()));

  instance.registerLazySingleton<RepositoryGoogleApis>(
          () => RepositoryGoogleApisImpl(instance(), instance()));
  instance.registerLazySingleton<RepositoryWishlist>(
          () => RepositoryWishlistImpl(instance()));

  //Infrastructure
  instance.registerLazySingleton<Dio>(() => Dio());

  //UseCase

  // instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));

  //provider
  instance.registerFactory<AppSettings>(() => AppSettings(instance()));
  instance.registerFactory<MoreViewModel>(
          () => MoreViewModel());


  AuthModule();
  HomeModule();
  WishlistModule();
}

AuthModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<UserInfoUseCase>(
            () => UserInfoUseCase(instance()));
    instance.registerFactory<UserUpdateUseCase>(
            () => UserUpdateUseCase(instance()));
    instance.registerFactory<RestPasswordUseCase>(() => RestPasswordUseCase(instance()));
    instance.registerFactory<DeleteAccountUseCase>(
            () => DeleteAccountUseCase(instance()));
    instance.registerFactory<AuthViewModel>(() => AuthViewModel(
        instance(), instance(), instance(), instance()));
  }
}

RegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));

  }
}

HomeModule() {
  if (!GetIt.I.isRegistered<RecipeUseCase>()) {
    // instance.registerFactory<SliderUseCase>(() => SliderUseCase(instance()));
    instance.registerFactory<RecipeUseCase>(
        () => RecipeUseCase(instance()));
    instance.registerFactory<UserAddAddressUseCase>(
            () => UserAddAddressUseCase(instance()));
    instance.registerFactory<HomeViewModel>(
        () => HomeViewModel(instance()));

  }
}


WishlistModule() {
  if (!GetIt.I.isRegistered<AddWithlistUseCase>()) {
    instance.registerFactory<AddWithlistUseCase>(() => AddWithlistUseCase(instance()));
    instance.registerFactory<DeleteWithlistUseCase>(() => DeleteWithlistUseCase(instance()));
    instance.registerFactory<WithlistUseCase>(() => WithlistUseCase(instance()));
    instance.registerFactory<IsProducWishlisttUseCase>(() => IsProducWishlisttUseCase(instance()));

    instance.registerFactory<FavoriteViewModel>(
            () => FavoriteViewModel(instance(),instance(),instance(),instance()));
  }
}



restetAllModule() {
  instance.reset(dispose: true);
  initAppModule();
}

