import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:myapp/core/network/network_info.dart';
import 'package:myapp/features/groceries/data/datasources/local/grocery_local_data_source.dart';
import 'package:myapp/features/groceries/data/datasources/local/grocery_local_data_source_impl.dart';
import 'package:myapp/features/groceries/data/datasources/remote/grocery_remote_data_source.dart';
import 'package:myapp/features/groceries/data/datasources/remote/grocery_remote_data_source_impl.dart';
import 'package:myapp/features/groceries/data/repositories/grocery_repository_impl.dart';
import 'package:myapp/features/groceries/domain/repositories/grocery_repository.dart';
import 'package:myapp/features/groceries/domain/usecase/get_all_groceries.dart';
import 'package:myapp/features/groceries/domain/usecase/get_grocery.dart';
import 'package:myapp/features/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//sl == serviceLocator
final sl = GetIt.instance;

Future<void> init() async {
  // Feature-Groceries
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // bloc
  sl.registerFactory(() => GroceryBloc(
        getAllGroceries: sl(),
        getGrocery: sl(),
      ));

  // Usecase
  sl.registerLazySingleton(() => GetAllGroceries(sl()));
  sl.registerLazySingleton(() => GetGrocery(sl()));

  // Repository
  sl.registerLazySingleton<GroceryRepository>(
    () => GroceryRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GroceryRemoteDataSource>(
    () => GroceryRemoteDataSourceImpl(
      client: sl(),
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<GroceryLocalDataSource>(
    () => GroceryLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}
