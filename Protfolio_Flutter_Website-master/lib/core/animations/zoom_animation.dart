import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_outline.dart';
import 'package:mysite/core/theme/app_theme.dart';

class ZoomAnimations extends StatefulWidget {
  const ZoomAnimations({Key? key}) : super(key: key);

  @override
  State<ZoomAnimations> createState() => _ZoomAnimationsState();
}

class _ZoomAnimationsState extends State<ZoomAnimations>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    sizeAnimation = Tween(begin: 0.0, end: 0.2).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.40, 0.75, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    //
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Center(
      child: FloatingWidget(
          child: SizedBox(
        width: size.width / 6,
        height: size.width / 6,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.white),
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.8),
            image: const DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.bottomLeft,
              image: (kDebugMode)
                  ? AssetImage('imgs/IMG_0107.png')
                  : AssetImage('assets/imgs/IMG_0107.png'),
            ),
          ),
        ),
      )),
    );
  }
}

class FloatingWidget extends StatefulWidget {
  final Widget child;

  const FloatingWidget({Key? key, required this.child}) : super(key: key);

  @override
  _FloatingWidgetState createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  double _rotateX = 0.0;
  double _rotateY = 0.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _rotateX = (event.localPosition.dx - (context.size!.width / 2)) / 100;
          _rotateY =
              ((context.size!.height / 2) - event.localPosition.dy) / 100;
        });
      },
      onExit: (event) {
        setState(() {
          _rotateX = 0.0;
          _rotateY = 0.0;
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_rotateY)
          ..rotateY(_rotateX),
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
  }
}
