import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/screen/pdf_view/pdf_controller.dart';

class PdfView extends GetWidget<PdfController> {
  const PdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56.0), // Set the height of the AppBar here
        child: appbar(),
      ),
      body: Center(
        child: const PDF().cachedFromUrl(
          controller.url,
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
