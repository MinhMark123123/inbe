import 'package:flutter/gestures.dart';
import 'package:aac_core/aac_core.dart';
import 'package:collection/collection.dart';

class RichTextSpanWidget extends StatelessWidget {
  String fullText;
  TextAlign textAlign;
  TextStyle? normalTextStyle;
  Color? richTextColor;
  bool hasUnderlineRichText;
  FontWeight? fontWeightRichText;
  List<String>? spanTexts;
  List<VoidCallback?>? onPressedActions;

  int _index = 0;
  final List<TextSpanPiece> _pieceList = [];

  RichTextSpanWidget(
    this.fullText, {
    Key? key,
    this.textAlign = TextAlign.center,
    this.normalTextStyle,
    this.richTextColor,
    this.spanTexts,
    this.fontWeightRichText,
    this.hasUnderlineRichText = false,
    this.onPressedActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (spanTexts?.isEmpty ?? true) {
      return Text(fullText, style: normalTextStyle);
    }
    _index = 0;
    _pieceList.clear();
    _split(fullText, spanTexts!.first);

    List<TextSpan> children = _pieceList.mapIndexed(
      (index, element) {
        dynamic actionIndex = spanTexts?.indexOf(element.text);
        return TextSpan(
          text: element.text,
          style: element.clickable
              ? normalTextStyle?.copyWith(
                  color: richTextColor ?? ColorName.secondaryBlue,
                  decoration:
                      hasUnderlineRichText ? TextDecoration.underline : null,
                  fontWeight: fontWeightRichText,
                )
              : normalTextStyle,
          recognizer: element.clickable
              ? (TapGestureRecognizer()..onTap = onPressedActions?[actionIndex])
              : null,
        );
      },
    ).toList();

    return RichText(
      text: TextSpan(
        style: normalTextStyle ?? textStyle.medium.fill(ColorName.carbonGrey),
        children: children,
      ),
      textAlign: textAlign,
    );
  }

  _split(String remainingText, String keyword) {
    if ((spanTexts?.isEmpty ?? true)) {
      return;
    }
    List<String> pieces = remainingText.split(keyword);
    if (pieces.length <= 1) {
      _pieceList.add(TextSpanPiece(pieces.first, false));
    } else {
      _pieceList.add(TextSpanPiece(pieces.first, false));
      _pieceList.add(TextSpanPiece(keyword, true));

      if (_index < spanTexts!.length - 1) {
        _index++;
        _split(
            remainingText.replaceRange(
                0, pieces.first.length + keyword.length, ''),
            spanTexts![_index]);
      } else if (pieces.length > 1) {
        _pieceList.add(TextSpanPiece(pieces[1], false));
      }
    }
  }
}

class TextSpanPiece {
  String text;
  bool clickable;

  TextSpanPiece(this.text, this.clickable);
}
