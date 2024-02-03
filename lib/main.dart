import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_app/provider/device_contact_provider.dart';
import 'package:contacts_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => ContactProvider(),),ChangeNotifierProvider(create: (context) => DeviceContactProvider(),)],
      child: MaterialApp(
        title: 'Contacts List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomePage(),
      ),
    );
  }
}
