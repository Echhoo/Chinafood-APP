import 'package:chinafood/style/flat_button.dart';
import 'package:chinafood/style/color.dart';
// import 'package:imd_app/old/style/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

/// A Dialog component which follows the design style of Food Project.
///
/// Unlike usual dialog, Food Dialog has no title. You can give the content
/// of the dialog with varible [text]. Buttons under content are provided with
/// [FinderFlatButton]. It's recommended to use less than two (included)
/// buttons.
///
/// A example using this dialog:
/// ```
/// _showDialog() async {
///   var result = await showDialog(
///     context: context,
///     barrierDismissible: false,
///     builder: (context) {
///       return FoodDialog(
///         "Click the button below to specify the number you give.",
///         buttons: [
///           FoodFlatButton(
///             child: Text("Number 1"),
///             onPress: () {
///               Navigator.pop(context, 1);
///             },
///           ),
///           FoodFlatButton(
///             child: Text("Number 2"),
///             onPress: () {
///               Navigator.pop(context, 2);
///             },
///           )
///         ],
///       );
///     }
///   );
///
///   print(result ?? "No number selected");
/// }
/// ```
///
/// Important: Please notic the parameter `barrierDismissible: false`. When
/// `barrierDismissible` is set to `true`, tapping on the barrier will dismiss
/// (close) the dialog. As dismissing dialog in this way will give no return
/// value, it's strongly recommand that set it to `false` if dialog has buttons.
///
class FoodDialog extends Dialog {
  final String icon;
  final text;
  final List<FindersFlatButton> buttons;
  final bool hasCloseIcon;

  FoodDialog(this.text,
      {this.icon,
      this.buttons,
      this.hasCloseIcon: false});

  @override
  Widget build(BuildContext context) {
    var buttonLength = this.buttons == null ? 0 : this.buttons.length;
    List<Widget> buttonWidgets = [];
    for (var i = 0; i < buttonLength; i++) {
      var button = Container(
          margin: EdgeInsets.only(left: 10, right: 10), child: buttons[i]);
      buttonWidgets.add(button);
    }
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 25, bottom: 20, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.string(
              //   this.icon,
              //   width: 65,
              //   height: 65,
              // ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buttonWidgets,
              )
            ],
          ),
        ),
      ),
    );
  }
}
