import 'package:bt_c5/common/app_images.dart';
import 'package:bt_c5/models/arguments.dart';
import 'package:bt_c5/router/route_config.dart';
import 'package:bt_c5/widgets/app_body_widget.dart';
import 'package:flutter/material.dart';

class S2 extends StatelessWidget {
  final Arguments arguments;
  final TextEditingController _controller = TextEditingController();

  S2({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (arguments.s2Text.isNotEmpty) {
      _controller.text = arguments.s2Text;
    }
    return AppBodyWidget(
      backgroundPath: AppImages.s2Background,
      controller: _controller,
      descriptionText: 'Watch Online\nor\nDownload Offline',
      onContinue: () {
        Navigator.pushNamed(
          context,
          RouteConfig.s3,
          arguments: arguments.copyWith(
            s2Text: _controller.text.trim(),
          ),
        );
      },
    );
  }
}
