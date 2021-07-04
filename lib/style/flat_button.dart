
// import 'package:imd_app/old/style/colors.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FindersFlatButton extends MaterialButton {
  FindersFlatButton({
    Key key,
    VoidCallback onPressed,
    bool primary = true,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    MouseCursor mouseCursor,
    EdgeInsetsGeometry padding:
        const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
    VisualDensity visualDensity,
    Clip clipBehavior: Clip.none,
    FocusNode focusNode,
    double elevation: 0.0,
    bool autofocus: false,
    MaterialTapTargetSize materialTapTargetSize,
    Widget child,
  })  : assert(clipBehavior != null),
        assert(autofocus != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          color: primary
              ? Color(0xFF888DF5)
              : Color(0x99888DF5),
          elevation: elevation,
          disabledColor: Color(0xFFBBBBBB),
          padding: padding,
          clipBehavior: clipBehavior,
          visualDensity: visualDensity,
          shape: new StadiumBorder(),
          child: child,
        );
}
