import 'package:flutter/material.dart';
import 'package:klik_daily/repository/repository.dart';
import 'package:klik_daily/service/api_service.dart';
import 'package:klik_daily/service/contant_url.dart';
import 'package:klik_daily/service/dio/dio_client.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>.value(
          value: Repository(
            ApiService(
              DioClient(apiBaseUrl: Constant.BASE_URL),
            ),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Klik Daily',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
