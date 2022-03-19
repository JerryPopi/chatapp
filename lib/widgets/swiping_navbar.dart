import 'package:chatapp/widgets/custom_snack.dart';
import 'package:flutter/material.dart';

class SwipingNavbar extends StatefulWidget {
  final Key? key;
  final List<Icon> items;
  final int currentIndex;
  final double? elevation;
  final Color? backgroundColor;
  final double? selectedSize;
  final double? unselectedSize;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? selectedFontSize;
  final double? unselectedFontSize;
  final bool? wrapAround;

  const SwipingNavbar({
    required this.items,
    this.currentIndex = 0,
    this.elevation = 0,
    this.backgroundColor = Colors.white,
    this.selectedColor = Colors.greenAccent,
    this.unselectedColor = Colors.grey,
    this.selectedSize = 30,
    this.unselectedSize = 25,
    this.selectedFontSize = 14,
    this.unselectedFontSize = 12,
    this.wrapAround = false,
    this.key,
  }) : super(key: key);

  @override
  _SwipingNavbarState createState() => _SwipingNavbarState();
}

class _SwipingNavbarState extends State<SwipingNavbar> {
  late PageController controller;
  late int currentIndex = 0;

  @override
  initState() {
    super.initState();
    controller = PageController(
        initialPage: currentIndex, keepPage: false, viewportFraction: 0.5);
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.redAccent)
      // ),
      height: 75,
      child: Center(
        child: SafeArea(
          child: SizedBox(
            width: 300,
            child: PageView.builder(
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.items.length,
              onPageChanged: ((value) {
                setState(() {
                  currentIndex = value;
                });
              }),
              controller: controller,
              itemBuilder: (context, index) => builder(index),
            ),
          ),
        ),
      ),
    );
  }

  builder(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: GestureDetector(
        onTap: () {
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double value = 1.0;
            if (controller.position.haveDimensions) {
              value = controller.page! - index;
              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
            }

            return SizedBox(
              height: Curves.easeOut.transform(value) * 75,
              width: Curves.easeOut.transform(value) * 75,
              child: child,
            );
          },
          child: widget.items[index],
        ),
      ),
    );
  }
}

class CustomKeepAlive extends StatefulWidget {
  const CustomKeepAlive({Key? key, required this.data}) : super(key: key);

  final Icon data;

  @override
  State<CustomKeepAlive> createState() => _CustomKeepAliveState();
}

class _CustomKeepAliveState extends State<CustomKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.data;
  }
}
