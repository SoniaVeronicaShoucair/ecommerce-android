import 'package:ecommerce_project/common/widgets/bottom_bar.dart';
import 'package:ecommerce_project/features/admin/screens/admin_screen.dart';
import 'package:ecommerce_project/features/auth/screens/auth-screen.dart';
import 'package:ecommerce_project/features/auth/services/auth_service.dart';
import 'package:ecommerce_project/providers/user_provider.dart';
import 'package:ecommerce_project/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/global_variables.dart';

void main() {
  runApp(MultiProvider(providers:[
      ChangeNotifierProvider(create: (context)=>UserProvider(),
      ),
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Add ScaffoldMessenger widget here
        title: 'E-commerce Application',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ?Provider.of<UserProvider>(context).user.type=='user'
            ? const BottomBar()
            :const AdminScreen()
            : const AuthScreen(),
      );
  }
}




