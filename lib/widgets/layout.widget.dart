import 'package:flutter/material.dart';
import 'package:projeto_99freelas/widgets/appbar.widget.dart';

const double layoutWidth = 640;

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({
    Key? key,
    required this.child,
    this.appBar,
    this.paddingTop = 0,
    this.paddingBottom = 16,
    this.paddingLeft = 16,
    this.paddingRight = 16,
  }) : super(key: key);
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final AppbarWidget? appBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxWidth: 720,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth < 720 ? paddingLeft : 0,
                    right: constraints.maxWidth < 720 ? paddingRight : 0,
                    bottom: paddingBottom,
                    top: paddingTop,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SliverLayout extends StatelessWidget {
  const SliverLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, sliverConstraints) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: sliverConstraints.crossAxisExtent > 720
                ? (sliverConstraints.crossAxisExtent - 720) / 2
                : 16,
            vertical: 32,
          ),
          sliver: child,
        );
      },
    );
  }
}
