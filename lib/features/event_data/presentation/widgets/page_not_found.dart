import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_constants.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: Navigator.of(context).pop,
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text(AppConstants.pageNotFoundText),
      ),
    );
  }
}
