import 'dart:convert';

import 'package:dornest/UI/DashBoard/Support/view_quotation/view_quotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/ColorConstants.dart';
import '../../../../apis/api.dart';
import '../../../../models/assigned_enq.dart';
import '../../../../models/enq_user.dart';
import '../../../../models/product_model.dart';
import '../../../../models/user_model.dart';
import '../../../GenerateQuotes/generate_quotes.dart';

class AllEnquiries extends StatefulWidget {
  final User user;

  const AllEnquiries({Key? key, required this.user}) : super(key: key);

  @override
  State<AllEnquiries> createState() => _GeneratesQuotesState();
}

class _GeneratesQuotesState extends State<AllEnquiries> {
  // final List<Product> enquiriesProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: ColorConstants.colorPrimary,
      //   // elevation: 0,
      //   // title: const Text('Assigned Enquiries'),
      // ),
      body: FutureBuilder(
          future: API.getAssignedEnquiries(userId: widget.user.id ?? ''),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.colorPrimary,
                ),
              );
            }
            Map data = jsonDecode(snapshot.data);
            if (data['response'] == '400') {
              return const Center(
                child: Text('No Enquiries Assigned'),
              );
            }
            List? dataList = data['0'];
            if (dataList == null) {
              return const Center(
                child: Text('No Enquires'),
              );
            }
            if (dataList.isEmpty) {
              return const Center(
                child: Text('No Enquires'),
              );
            }
            List<AssignedEnquiry> assignedEnq = [];
            for (var enqData in dataList) {
              assignedEnq.add(AssignedEnquiry.fromJson(enqData));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: assignedEnq.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: API.getEnquiriesDetails(
                      enquiryId: assignedEnq[index].enquireId),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox.shrink();
                    }
                    Map map = jsonDecode(snapshot.data);
                    EnquiryUser enquiryUser = EnquiryUser.fromJson(map['0']);
                    List<String> productIds = enquiryUser.pid.split(',');
                    return ExpansionTile(
                      title: Text(
                        'Enquiry ${index + 1}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.colorPrimary),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name- ' + enquiryUser.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  ),
                                  Text(
                                    'Email- ' + enquiryUser.email,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  ),
                                  Text(
                                    'Mobile- ' + enquiryUser.mobile,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  ),
                                  Text(
                                    'Location- ' + enquiryUser.location,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  )
                                ],
                              ),
                              assignedEnq[index].quoteSend == '0'
                                  ? ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GeneratesQuotes(
                                              enquiryUser: enquiryUser,
                                              productIds: productIds,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Generate\nQuotation',
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: ColorConstants.colorPrimary,
                                          padding: const EdgeInsets.all(8),
                                          elevation: 0),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ViewQuotation(
                                              userId: widget.user.id,
                                              enquireId: enquiryUser.id,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'View\nQuotation',
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: ColorConstants.colorPrimary,
                                          padding: const EdgeInsets.all(8),
                                          elevation: 0),
                                    ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productIds.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FutureBuilder(
                              future: API.getProducts(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.data == null) {
                                  return const SizedBox.shrink();
                                }
                                Map mapData = jsonDecode(snapshot.data);
                                List dataList = mapData['0'];
                                List<Product> products = [];

                                for (var data in dataList) {
                                  if (data['product_id'] == productIds[index]) {
                                    products.add(Product.fromJson(data));
                                  }
                                }
                                // enquiriesProduct.addAll(products);
                                if (products.isEmpty) {
                                  return const Center(
                                    child: Text('No Products Found'),
                                  );
                                }
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: products.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      color: (index % 2 != 0)
                                          ? ColorConstants.colorTile
                                          : ColorConstants.colorWhite,
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      padding: EdgeInsets.only(
                                          left: 10.h, top: 10.h, bottom: 10.h),
                                      child: Text(
                                        products[index].productId +
                                            ' - ' +
                                            products[index].product,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'PoppinsMedium',
                                            color: ColorConstants.colorBlack,
                                            fontSize: 15.sp),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        )
                      ],
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
