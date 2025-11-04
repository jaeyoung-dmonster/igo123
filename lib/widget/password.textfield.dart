import 'package:flutter/material.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/theme/my.text.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? errorText;  
  final double? top;
final bool autofocus;
  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.top,
    this.errorText,
    this.autofocus = false,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(                  
    // height: 78,

                    padding: EdgeInsets.only(right: 14, top: widget.top ?? 8, bottom: 10,left: 14),
                    decoration: BoxDecoration(
                      color: DARKMODE900,
                      borderRadius: BorderRadius.circular(15),
                      // border: Border.all(color: DARKMODE700, width: 1),
                    ),
                    child: TextFormField(
        controller: widget.controller,
        autofocus: widget.autofocus,
        obscureText: !_passwordVisible,
        cursorColor: DARKMODE500,
        
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: MyText().NOTOSANS_16_500_TEXT.copyWith(color: DARKMODE500),
          // filled: true,
          // fillColor: DARKMODE900,
          errorText: widget.errorText,
          
        
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 12, bottom: 12, right: 8), // 패딩 조정
          suffixIcon: Transform.translate(
  offset: Offset(18, 0), // x축으로 10만큼 오른쪽으로 이동
  child: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
                size: 20, // 아이콘 크기 조정
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              padding: EdgeInsets.zero, // 아이콘 버튼의 패딩 제거
              constraints: BoxConstraints(minWidth: 40, minHeight: 40), // 최소 크기 설정
            ),
          ),
        ),
        style: MyText().NOTOSANS_16_500_TEXT.copyWith(color: DARKMODE100),
        validator: widget.validator,
        onChanged: widget.onChanged,
        
      
    ));
  }
}