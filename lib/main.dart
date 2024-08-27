import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/domain/usecase/get_all_groceries.dart';
import 'package:myapp/features/groceries/domain/usecase/get_grocery.dart';
import 'package:myapp/features/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:myapp/features/groceries/presentation/pages/basket_page.dart';
import 'package:myapp/features/groceries/presentation/pages/details.dart';
import 'package:myapp/features/groceries/presentation/pages/home_page.dart';
import 'package:myapp/features/groceries/presentation/pages/splash_screen.dart';
import 'package:myapp/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GroceryBloc(
            getAllGroceries: di.sl<GetAllGroceries>(),
            getGrocery: di.sl<GetGrocery>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Groceries App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        initialRoute: '/splash',
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/splash':
              return MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              );
            case '/home':
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            case '/details':
              if (args is GroceryEntity) {
                return MaterialPageRoute(
                  builder: (context) => Details(grocery: args),
                );
              }
              return _errorRoute(); // Handle the case where arguments are invalid
            case '/basket':
              if (args is List<GroceryEntity>) {
                return MaterialPageRoute(
                  builder: (context) => BasketPage(basketItems: args,),
                );
              }
              return _errorRoute(); // Handle the case where arguments are invalid
            default:
              return _errorRoute(); // Handle unknown routes
          }
        },
      ),
    );
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
