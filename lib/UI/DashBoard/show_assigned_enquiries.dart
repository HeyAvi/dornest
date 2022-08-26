import 'dart:convert';

import 'package:dornest/apis/api.dart';
import 'package:dornest/models/assigned_enq.dart';
import 'package:flutter/material.dart';

import '../../Utils/ColorConstants.dart';
import 'Support/view_quotation/view_quotation.dart';

class ShowAssignedEnquiries extends StatefulWidget {
  final String enquiryUserId;

  const ShowAssignedEnquiries({Key? key, required this.enquiryUserId})
      : super(key: key);

  @override
  State<ShowAssignedEnquiries> createState() => _ShowAssignedEnquiriesState();
}

class _ShowAssignedEnquiriesState extends State<ShowAssignedEnquiries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Enquiries'),
        backgroundColor: ColorConstants.colorPrimary,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: API.getAssigners(enquiryId: widget.enquiryUserId),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            Map mapData = jsonDecode(snapshot.data);
            List? listData = mapData['0'];
            if (listData == null) {
              return const Center(
                child: Text('No Assigned Enquiries'),
              );
            }

            if (listData.isEmpty) {
              return const Center(
                child: Text('No Assigned Enquiries'),
              );
            }

            List<AssignedEnquiry> assignedEnquiries = [];
            for (var data in listData) {
              assignedEnquiries.add(AssignedEnquiry.fromJson(data));
            }

            return ListView.builder(
              itemCount: assignedEnquiries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: ColorConstants.colorPrimary,
                      child: Icon(Icons.person),
                    ),
                    title: Text('User Id- '+assignedEnquiries[index].enquireReceiver),
                    subtitle:
                        Text(assignedEnquiries[index].createdAt.toString()),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConstants.colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('View'),
                      onPressed:  (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewQuotation(
                              userId: assignedEnquiries[index].enquireReceiver,
                              enquireId: assignedEnquiries[index].enquireId,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
