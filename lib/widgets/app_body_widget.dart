import 'package:bt_c5/common/app_colors.dart';
import 'package:bt_c5/common/app_images.dart';
import 'package:bt_c5/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBodyWidget extends StatefulWidget {
  final String backgroundPath;
  final TextEditingController controller;
  final String descriptionText;
  final Function() onContinue;

  const AppBodyWidget({
    Key? key,
    required this.backgroundPath,
    required this.descriptionText,
    required this.controller,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<AppBodyWidget> createState() => _AppBodyWidgetState();
}

class _AppBodyWidgetState extends State<AppBodyWidget> {
  late final GlobalKey globalKey;
  Size size = const Size(0.0, 0.0);
  Offset offset = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey();
  }

  void setInfo() {
    RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    setState(() {
      size = renderBox?.size ?? const Size(0.0, 0.0);
      offset = renderBox?.localToGlobal(Offset.zero) ?? const Offset(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.backgroundPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: Image.asset(
                    key: globalKey,
                    AppImages.marvelLogo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 52),
              if (widget.backgroundPath != AppImages.s4Background)
                Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  color: AppColors.textFieldBackgroundColor,
                  child: Center(
                    child: TextField(
                      controller: widget.controller,
                      maxLines: 1,
                      style: AppTextStyles.primaryS20W600,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                    ),
                  ),
                ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.descriptionText,
                  style: AppTextStyles.whiteS20W600,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        buildInfoText(),
        Positioned(
          bottom: 80,
          left: 32,
          right: 32,
          child: InkWell(
            onTap: () {
              widget.onContinue.call();
            },
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.backgroundPath != AppImages.s4Background
                    ? AppColors.buttonBackgroundColor
                    : Colors.transparent,
                border: Border.all(color: AppColors.buttonBackgroundColor),
              ),
              child: Text(
                widget.backgroundPath != AppImages.s4Background
                    ? 'Continue'
                    : 'Login',
                style: AppTextStyles.whiteS18W600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInfoText() {
    if (widget.backgroundPath == AppImages.s4Background) {
      Future.delayed(
        const Duration(microseconds: 1),
        () => setInfo(),
      );
      return Positioned(
        top: 32,
        left: 32,
        right: 32,
        child: Text(
          'Size: $size\nPosition: $offset',
          style: AppTextStyles.whiteS18W600,
          textAlign: TextAlign.end,
        ),
      );
    }
    return const SizedBox();
  }
}
