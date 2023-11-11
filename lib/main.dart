import 'package:atebaa/package/appTextFiled.dart';
import 'package:atebaa/screen/alatebaaScreen.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'componants/appColors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextEditingController city = TextEditingController();
    TextEditingController specialty = TextEditingController();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'atebaa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: AppColors().whiteC,
        appBar: AppBar(
          backgroundColor: AppColors().whiteC,
        ),
        body: ListView(
          children: [
            Center(
              child: Text(
                "atebaa",
                style: TextStyle(
                    fontSize: 45,
                    color: AppColors().movyC,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30,),
            AppTextField(
                dataList: [
                  SelectedListItem(name: 'manzala'),
                  SelectedListItem(name: 'gamalia'),
                  SelectedListItem(name: 'matarya'),
                ],
                textEditingController: city,
                title: "Select City",
                hint: "city",
                isCitySelected: true),
            AppTextField(
                dataList: [
                  SelectedListItem(name: 'batna'),
                  SelectedListItem(name: 'ezam'),
                  SelectedListItem(name: 'ayon'),
                  SelectedListItem(name: 'graha'),
                ],
                textEditingController: specialty,
                title: "Specialty",
                hint: "specialty",
                isCitySelected: true),
            MaterialButton(
              height: 40,
              onPressed: () {
                Get.to(Doctors());
              },
              color: AppColors().movyC,
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
