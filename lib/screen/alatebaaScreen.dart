import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../componants/appColors.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});
  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List doctors = [];
  CollectionReference doctorsref =
      FirebaseFirestore.instance.collection('doctors');
  getData() async {
    var responsebody = await doctorsref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        doctors.add(element.data());
      });
    });
    print(doctors);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors().whiteC,
        appBar: AppBar(
          backgroundColor:AppColors().whiteC,
          title: Text(
            "Doctors",
            style: TextStyle(fontSize: 32, color: AppColors().blakC),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              navigator?.pop();
            },
            color: AppColors().movyC,
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        //  backgroundColor: Colors.lightGreen,
        body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, i) => Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 180,
                                  width: 100,
                                  child: Image.asset("images/imageMD.PNG")),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 160,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${doctors[i]['name']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors().blakC),
                                    ),
                                    Text(
                                      "${doctors[i]['address']}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors().movyC),
                                    ),
                                    Container(

                                      decoration: BoxDecoration(color: AppColors().liteMovy,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "${doctors[i]['spatialisty']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors().movyC),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "(+20) ${doctors[i]['number']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors().blakC),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, i) => SizedBox(
                    height: 5,
                  ),
              itemCount: doctors.length),
        ),
      ),
    );
  }
}
