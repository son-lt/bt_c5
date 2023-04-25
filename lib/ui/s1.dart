import 'package:bt_c5/common/app_images.dart';
import 'package:bt_c5/models/arguments.dart';
import 'package:bt_c5/router/route_config.dart';
import 'package:bt_c5/widgets/app_body_widget.dart';
import 'package:flutter/material.dart';

class S1 extends StatelessWidget {
  final Arguments arguments;
  final TextEditingController _controller = TextEditingController();

  S1({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (arguments.s1Text.isNotEmpty) {
      _controller.text = arguments.s1Text;
    }
    return AppBodyWidget(
      backgroundPath: AppImages.s1Background,
      controller: _controller,
      descriptionText:
          'All your favourite\nMARVEL Movies & Series\nat one place',
      onContinue: () {
        Navigator.pushNamed(
          context,
          RouteConfig.s2,
          arguments: arguments.copyWith(
            s1Text: _controller.text.trim(),
          ),
        );
      },
    );
  }
}
