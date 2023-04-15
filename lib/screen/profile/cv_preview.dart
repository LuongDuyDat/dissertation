import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/theme.dart';
import 'package:pdfx/pdfx.dart';

import '../../util/navigate.dart';

class CVPreviewPage extends StatelessWidget {
  const CVPreviewPage({super.key, required this.filePath});

  final String filePath;

  @override
  Widget build(BuildContext context) {
    final pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset(filePath),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secondaryLightColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: backgroundLightColor2,),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Text('CV', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: backgroundLightColor2,),),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_before, color: backgroundLightColor2,),
            onPressed: () {
              pdfControllerPinch.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          PdfPageNumber(
            controller: pdfControllerPinch,
            builder: (_, loadingState, page, pagesCount) => Container(
              alignment: Alignment.center,
              child: Text(
                '$page/${pagesCount ?? 0}',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: backgroundLightColor2,),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.navigate_next, color: backgroundLightColor2,),
            onPressed: () {
              pdfControllerPinch.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
        ],
      ),
      body: PdfViewPinch(
        builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          errorBuilder: (_, error) => Center(child: Text(error.toString())),
        ),
        controller: pdfControllerPinch,
      ),
    );
  }

}