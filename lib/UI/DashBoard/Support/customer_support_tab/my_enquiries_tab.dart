import 'dart:convert';

import 'package:dornest/apis/api.dart';
import 'package:dornest/models/my_enquiry_model.dart';
import 'package:dornest/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../models/operation_enquiry_model.dart';

class MyEnquiriesTab extends StatefulWidget {
  final User? user;
  final String? mobile;

  const MyEnquiriesTab({Key? key, required this.user, this.mobile})
      : super(key: key);

  @override
  State<MyEnquiriesTab> createState() => _MyEnquiriesTabState();
}

class _MyEnquiriesTabState extends State<MyEnquiriesTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: API.myEnquiries(mobile: widget.mobile ?? widget.user?.mobile),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        Map mapData = jsonDecode(snapshot.data);
        print(jsonEncode(mapData));
        List? dataList = mapData['0'];
        if (dataList == null) {
          return const Center(
            child: Text('No Enquiries'),
          );
        }
        if (dataList.isEmpty) {
          return const Center(
            child: Text('No Enquiries'),
          );
        }
        List<MyEnquiry> myEnquiries = [];
        // todo condition if user id null and mobile is n

        for (var data in dataList) {
          myEnquiries.add(MyEnquiry.fromJson(data));
        }
        if (myEnquiries.isEmpty) {
          return const Center(
            child: Text('No Enquiries'),
          );
        }
        print(myEnquiries.length);
        return ListView.builder(
          itemCount: myEnquiries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Product Id: ${myEnquiries[index].pid}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mobile: ${myEnquiries[index].mobile}'),
                  Text('message: ${myEnquiries[index].message ?? ''}'),
                  Text('email: ${myEnquiries[index].email ?? ''}'),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
