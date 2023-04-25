import 'package:bt_c5/common/app_images.dart';
import 'package:bt_c5/models/arguments.dart';
import 'package:bt_c5/router/route_config.dart';
import 'package:bt_c5/widgets/app_body_widget.dart';
import 'package:flutter/material.dart';

class S4 extends StatelessWidget {
  final Arguments arguments;
  final TextEditingController _controller = TextEditingController();

  S4({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (arguments.s1Text.isEmpty) {
          Navigator.popAndPushNamed(
            context,
            RouteConfig.s1,
            arguments: arguments,
          );
        } else if (arguments.s2Text.isEmpty) {
          Navigator.popAndPushNamed(
            context,
            RouteConfig.s2,
            arguments: arguments,
          );
        } else if (arguments.s3Text.isEmpty) {
          Navigator.popAndPushNamed(
            context,
            RouteConfig.s3,
            arguments: arguments,
          );
        }
        return false;
      },
      child: AppBodyWidget(
        backgroundPath: AppImages.s4Background,
        controller: _controller,
        descriptionText:
            '${arguments.s1Text}\n${arguments.s2Text}\n${arguments.s3Text}',
        onContinue: () {
          if (arguments.s1Text.isNotEmpty &&
              arguments.s2Text.isNotEmpty &&
              arguments.s3Text.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success!'),
              ),
            );
          }
        },
      ),
    );
  }
}
