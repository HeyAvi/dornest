import 'package:dornest/apis/api.dart';
import 'package:flutter/material.dart';

import '../../Utils/ColorConstants.dart';
import '../../models/enq_user.dart';

class ShowAssignedEnquiries extends StatefulWidget {
  final String enquiryUserId;
  const ShowAssignedEnquiries({Key? key, required this.enquiryUserId}) : super(key: key);

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
        builder: (context, snapshot) {
          print(snapshot.data);
          return const Center(
            child: Text('Show Assigned Enquiries'),
          );
        }
      ),
    );
  }
}
