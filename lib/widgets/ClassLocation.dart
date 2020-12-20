import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassLocation extends StatefulWidget {
  ClassLocation(this.classInfo, {Key key}) : super(key: key);

  final Map classInfo;

  @override
  _ClassLocationState createState() => _ClassLocationState();
}

class _ClassLocationState extends State<ClassLocation>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4> _animationReset;
  AnimationController _controllerReset;

  void _onAnimateReset() {
    _transformationController.value = _animationReset.value;
    if (!_controllerReset.isAnimating) {
      _animationReset?.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    _animateResetInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        children: [
          DefaultTextStyle(
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black87),
            child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.classInfo['startTime']} - ${widget.classInfo['endTime']}',
                        ),
                        Text(
                          '${widget.classInfo['name']}',
                        )
                      ],
                    ),
                    Text(
                        'к. ${widget.classInfo['building']}, ауд. ${widget.classInfo['room']}')
                  ],
                )),
          ),
          const Divider(thickness: 1),
          Container(
            child: InteractiveViewer(
                panEnabled: false,
                // Set it to false to prevent panning.
                boundaryMargin: EdgeInsets.all(32),
                minScale: 1,
                maxScale: 5,
                onInteractionStart: _onInteractionStart,
                onInteractionEnd: _onInteractionEnd,
                transformationController: _transformationController,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: SvgPicture.asset(
                        'images/${widget.classInfo['building']}_${widget.classInfo['room'][0]}.svg',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SvgPicture.asset(
                      'images/${widget.classInfo['building']}_${widget.classInfo['room']}.svg',
                      color: Colors.green,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
