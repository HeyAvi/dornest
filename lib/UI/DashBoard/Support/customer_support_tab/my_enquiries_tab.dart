import 'dart:convert';

import 'package:dornest/apis/api.dart';
import 'package:dornest/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../models/operation_enquiry_model.dart';

class MyEnquiriesTab extends StatefulWidget {
  final User? user;
  final String? mobile;

  const MyEnquiriesTab({Key? key, required this.user, this.mobile}) : super(key: key);

  @override
  State<MyEnquiriesTab> createState() => _MyEnquiriesTabState();
}

class _MyEnquiriesTabState extends State<MyEnquiriesTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          Map mapData = jsonDecode(snapshot.data);
          print(mapData);
          List? dataList = mapData['0'];
          if (dataList == null) {
            return const Center(
              child: Text('No Enquiries'),
            );
          } if (dataList.isEmpty) {
            return const Center(
              child: Text('No Enquiries'),
            );
          }
          List<OperationEnquiry> operationEnquiries = [];
          // todo condition if user id null and mobile is n

          for (var data in dataList) {
            if(widget.user != null && data['id'] == widget.user?.id) {
              operationEnquiries.add(OperationEnquiry.fromJson(data));
            } else if(widget.mobile != null && data['mobile'] == widget.mobile) {
              operationEnquiries.add(OperationEnquiry.fromJson(data));
            }
          }
          if(operationEnquiries.isEmpty) {
            return const Center(
              child: Text('No Enquiries'),
            );
          }
          print(operationEnquiries.length);
          return ListView.builder(
            itemCount: operationEnquiries.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(''),
                subtitle: Text('kkk'),
                trailing: Text('kkk'),
              );
            },
          );
        },
        future: API.getAllOperatorEnquiries());
  }
}
