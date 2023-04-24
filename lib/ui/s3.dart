import 'package:bt_c5/common/app_images.dart';
import 'package:bt_c5/models/arguments.dart';
import 'package:bt_c5/router/route_config.dart';
import 'package:bt_c5/widgets/app_body_widget.dart';
import 'package:flutter/material.dart';

class S3 extends StatelessWidget {
  final Arguments arguments;
  final TextEditingController _controller = TextEditingController();

  S3({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (arguments.s3Text.isNotEmpty) {
      _controller.text = arguments.s3Text;
    }
    return AppBodyWidget(
      backgroundPath: AppImages.s3Background,
      controller: _controller,
      descriptionText:
          'Create profiles\nfor different members &\nget personalised\nrecommendations',
      onContinue: () {
        Navigator.popAndPushNamed(
          context,
          RouteConfig.s4,
          arguments: arguments.copyWith(
            s3Text: _controller.text.trim(),
          ),
        );
      },
    );
  }
}
