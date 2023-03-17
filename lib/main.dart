import 'package:carrot_app/Authentication/auth.dart';
import 'package:carrot_app/cart/cart_provider.dart';
import 'package:carrot_app/cart/cart_screen.dart';
import 'package:carrot_app/mainPage/home_screen.dart';
import 'package:carrot_app/Authentication/login_screen.dart';
import 'package:carrot_app/profile/profile_screen.dart';
import 'package:carrot_app/splash_screen.dart';
import 'package:carrot_app/widgets/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthService>(create: (_) => AuthService()),
      StreamProvider(create: (context) => context.read<AuthService>().authStateChange, initialData: null,),
      ChangeNotifierProvider(create: (context) => CartProvider()),
    ],
    child: MaterialApp(
      home: splashPage(),
      //initialRoute: ,
      //routes: {
        //AuthWrapper.routeName: (ctx) => AuthWrapper(),
        //login.routeName: (ctx) => login(),
        //HomePage.routeName: (ctx) => HomePage(),
        //Cart.routeName: (ctx) => Cart(),
        //Profile.routeName: (ctx) => Profile(),
      //},
    ),);
  }
}

class AuthWrapper extends StatelessWidget {
  static const routeName = '/';

  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    if(user==null){
      return login();
    }else{
      return mainPage();
    }
  }
}
