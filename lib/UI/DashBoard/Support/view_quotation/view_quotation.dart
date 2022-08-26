import 'dart:convert';
import 'dart:io';

import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../models/quotation_model.dart';
import '../../HomePage.dart';

class ViewQuotation extends StatefulWidget {
  final String? enquireId;
  final String? userId;

  const ViewQuotation({
    Key? key,
    required this.enquireId,
    required this.userId,
  }) : super(key: key);

  @override
  State<ViewQuotation> createState() => _ViewQuotationState();
}

class _ViewQuotationState extends State<ViewQuotation> {
  List<String> quotationString = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Quotation'),
        backgroundColor: ColorConstants.colorPrimary,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: API.viewQuotation(
            enquiryId: widget.enquireId,
            userId: widget.userId,
          ),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.colorPrimary,
                ),
              );
            }
            Map map = jsonDecode(snapshot.data);
            List? list = map['0'];
            if (list == null) {
              return const Center(
                child: Text('No Quotation Found'),
              );
            }
            if (list.isEmpty) {
              return const Center(
                child: Text('No Quotation Found'),
              );
            }
            List<QuotationModel> quotationList = [];
            for (var data in list) {
              quotationList.add(QuotationModel.fromJson(data));
            }
            quotationString.clear();
            for (var element in quotationList) {
              String data = 'Product Id: ${element.pid}\n'
                  'Product Thickness: ${element.thikness}\n'
                  'Product Width: ${element.width}\n'
                  'Product Height: ${element.height}\n'
                  'Quantity: ${element.quantity}\n'
                  'Product Price: Rs.${element.price}\n'
                  'Discount: ${element.discount}%\n'
                  'GST: ${element.gst}%\n'
                  'Total: Rs.${element.total}\n\n\n';
              quotationString.add(data);
            }
            return ListView.builder(
              itemCount: quotationList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text('Total: ${quotationList[index].total}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thickness: ${quotationList[index].thikness}'),
                        Text('Width: ${quotationList[index].width}'),
                        Text('Height: ${quotationList[index].height}'),
                        Text('Quantity: ${quotationList[index].quantity}'),
                        Text('Price: ${quotationList[index].price}'),
                        Text('Product id: ${quotationList[index].pid}'),
                        Text('GST: ${quotationList[index].gst}'),
                        Text('Discount: ${quotationList[index].discount}'),
                      ],
                    ),
                    trailing: Text(quotationList[index].total),
                  ),
                );
              },
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.colorPrimary,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            elevation: 0.0,
          ),
          onPressed: () async {
            File file = await createPdf();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfPageView(
                  file: file,
                ),
              ),
            );
          },
          child: const Text('Get PDF'),
        ),
      ),
    );
  }

  Future<File> createPdf() async {
    final PdfDocument document = PdfDocument();
    var bounds = const Rect.fromLTWH(10, 10, 300, 50);
    document.pages.add();
    PdfPage page = document.pages[0];
    page.graphics.drawString('Invoice\n',
        PdfStandardFont(PdfFontFamily.helvetica, 30, style: PdfFontStyle.bold),
        brush: PdfBrushes.black, bounds: bounds);
    PdfUnorderedList(
            items: PdfListItemCollection(quotationString),
            marker: PdfUnorderedMarker(style: PdfUnorderedMarkerStyle.none),
            font: PdfStandardFont(
              PdfFontFamily.helvetica,
              20,
            ),
            indent: 20,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: page, bounds: const Rect.fromLTWH(0, 80, 0, 0));
// Save the document.
    Directory temp = await getTemporaryDirectory();
    File f =
        await File(temp.path + "/invoice.pdf").writeAsBytes(document.save());

// Dispose the document.
    document.dispose();
    return f;
  }
}

class PdfPageView extends StatelessWidget {
  const PdfPageView({
    Key? key,
    required this.file,
  }) : super(key: key);

  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: Container(
            width: MediaQuery.of(context).size.width.w,
            height: 45.h,
            color: ColorConstants.colorPrimary,
            child: Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                    width: 30.w,
                    height: 17.h,
                    color: ColorConstants.colorWhite,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Invoice PDF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.colorWhite,
                      fontSize: 17.sp),
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SfPdfViewer.file(file)),
            MaterialButton(
              onPressed: () async {
                final params = SaveFileDialogParams(
                  sourceFilePath: file.path,
                  fileName: 'invoice.pdf',
                  mimeTypesFilter: [
                    'application/pdf',
                  ],
                );
                final filePath =
                    await FlutterFileDialog.saveFile(params: params);
                if (filePath != null) {
                  //show snackbar
                  final snackBar = SnackBar(
                    content: Text('File saved to $filePath'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (a) => false);
                }
              },
              minWidth: double.infinity,
              padding: EdgeInsets.only(
                  top: 10.h, bottom: 20.h, left: 20.w, right: 20.w),
              child: Text("Save",
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      color: Colors.white,
                      fontSize: 15.sp)),
              color: ColorConstants.colorPrimary,
            )
          ],
        ),
      ),
    );
  }
}
