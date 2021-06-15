import 'package:flutter/material.dart';

import 'dimen.dart';

class IconAction<T> extends PopupMenuEntry<T> {
  final Widget icon;
  final Widget title;
  final bool danger;
  @override
  final double height;

  final T value;

  const IconAction(
      {Key key,
      this.value,
      this.icon,
      this.title,
      this.danger = false,
      this.height = XPlainDimensions.actionHeight})
      : super(key: key);

  @override
  _IconActionState createState() => _IconActionState<T>();

  @override
  bool represents(T value) {
    return value == this.value;
  }
}

class _IconActionState<T> extends State<IconAction> {
  @override
  Widget build(BuildContext context) {
    return IconActionButton(
      onTap: _handleTap,
      title: widget.title,
      height: widget.height,
      icon: widget.icon,
      danger: widget.danger,
    );
  }

  void _handleTap() {
    Navigator.pop<T>(context, widget.value);
  }
}

class IconActionButton extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final double height;
  final bool danger;

  final Function onTap;

  const IconActionButton(
      {Key key, this.icon, this.title, this.height, this.danger, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(devicePixelRatio: 1.0, textScaleFactor: 1.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: 162,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconTheme(
                  data: IconThemeData(
                      size: 16, color: danger ? Colors.red : Colors.grey),
                  child: icon ?? Container(),
                ),
              ),
              Expanded(
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: danger ? Colors.red : Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                  child: title,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
