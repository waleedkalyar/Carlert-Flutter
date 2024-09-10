// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

//ignore: must_be_immutable
class AppTextInputField extends StatefulWidget {
  String hint;
  bool floatHint;
  Widget? icon;
  Widget? endIcon;
  double? fieldHeight;
  Color? filledColor;
  int? minLines;
  bool filledFocus = true;
  double? borderRadius;
  String? errorText;

  String? initialValue;
  Function()? iconClick;
  Function()? onEndIconClick;
  Function(String value)? onUpdateInput;

  TextEditingController? textEditingController;
  String? suffixText;

  TextInputType? keyboardType;

  Function(String value)? onFieldSubmitted;
  FocusNode? focusNode;

  AppTextInputField(
      {super.key,
      required this.hint,
      required this.floatHint,
      this.icon,
      this.fieldHeight,
      this.filledColor,
      this.minLines,
      this.filledFocus = true,
      this.borderRadius,
      this.iconClick,
      this.endIcon,
      this.onEndIconClick,
      this.onUpdateInput,
      this.keyboardType,
      this.textEditingController,
      this.errorText,
      this.suffixText,
      this.initialValue,
      this.onFieldSubmitted,
      this.focusNode});

  @override
  State<AppTextInputField> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInputField> {
  final FocusNode _focusNode = FocusNode();

  bool _isFocused = false;

  late TextEditingController _editingController;

  final _controller = SuperTooltipController();

  @override
  void initState() {
    super.initState();
    _editingController =
        widget.textEditingController ?? TextEditingController();
    _editingController.text = widget.initialValue ?? "";
    widget.onUpdateInput != null ? (_editingController.value.text) : "";
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.textEditingController == null) {
      _editingController.dispose();
    }

    widget.focusNode?.dispose();
    widget.textEditingController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.minLines != null && widget.minLines! <= 1
          ? widget.fieldHeight ?? 60
          : null,
      // padding: EdgeInsets.symmetric(horizontal: _isFocused ? 0 : widget.icon != null ? 0 : 12),
      decoration: BoxDecoration(
          color: widget.filledFocus
              ? widget.filledColor ?? appWhite
              : _isFocused
                  ? Colors.transparent
                  : widget.filledColor ?? appGrayBackground,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0)),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {},
          keyboardType: widget.keyboardType,
          textAlignVertical: TextAlignVertical.center,
          focusNode: widget.focusNode ?? _focusNode,
          minLines: widget.minLines ?? 1,
          maxLines: widget.minLines ?? 1,
          controller: _editingController,
          onChanged: (value) {
            // var value = _editingController.value.text;
            if (widget.onUpdateInput != null) {
              widget.onUpdateInput!(_editingController.value.text);
            }
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: !widget.floatHint ? const EdgeInsets.all(14) : null,
            prefixIcon: widget.icon != null
                ? IconButton(
                    icon: widget.icon!,
                    onPressed: widget.iconClick,
                  )
                : null,
            suffixIcon: widget.errorText != null
                ? errorToolTip()
                : widget.endIcon != null
                    ? IconButton(
                        icon: widget.endIcon!,
                        onPressed: widget.onEndIconClick,
                      )
                    : null,
            suffixText: widget.suffixText,
            labelText: widget.floatHint ? widget.hint : null,
            hintText: !widget.floatHint ? widget.hint : null,
            labelStyle: Theme.of(context).primaryTextTheme.labelMedium,
            hintStyle: TextStyle(
                color: appGray.withOpacity(0.8),
                fontSize: 14,
                fontWeight: FontWeight.normal),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 8.0)),
                borderSide: BorderSide(
                    color: widget.errorText == null ? appGrayLight : appRed,
                    width: 0)),
            border: widget.errorText == null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 8.0)),
                    borderSide: const BorderSide(color: appRed, width: 0)),
            enabledBorder: widget.errorText == null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 8.0)),
                    borderSide: const BorderSide(color: appRed, width: 1)),
          )),
    );
  }

  Widget errorToolTip() {
    return SuperTooltip(
      hasShadow: false,
      minimumOutsideMargin: 20,
      backgroundColor: appRed,
      borderColor: appGray,
      borderRadius: 8,
      borderWidth: 0,
      elevation: 1,
      content: Text(
        widget.errorText ?? "Something went wrong...",
        style: Theme.of(context)
            .primaryTextTheme
            .bodySmall
            ?.copyWith(color: appWhite, fontSize: 11),
      ),
      controller: _controller,
      child: InkWell(
        onTap: () {
          _controller.showTooltip();
        },
        child: const Icon(
          Icons.error_outline_rounded,
          size: 24,
          color: appRed,
        ),
      ),
    );
  }
}
