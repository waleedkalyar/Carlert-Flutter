import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/auth/signin/bloc/sign_in_phone_bloc.dart';
import 'package:carlet_flutter/src/widgets/app_filled_button.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:carlet_flutter/src/widgets/input_container_only.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneForm extends StatefulWidget {
  const SignInPhoneForm({Key? key}) : super(key: key);

  @override
  State<SignInPhoneForm> createState() => _SignInPhoneFormState();
}

class _SignInPhoneFormState extends State<SignInPhoneForm> {
  String _phoneNumber = "";
  String _phoneCode = "971";
  String? _phoneError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.phone_iphone),
            Text(
              enterPhone,
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),


        Row(
          children: [
            Expanded(
              flex: 6,
              child: InputContainerOnly(
                child: Center(
                  child: CountryCodePicker(
                    initialSelection: 'AE',
                    //favorite: const ['+971', 'AE'],
                    onInit: (code) {
                      _phoneCode = code.toString();
                    },
                    onChanged: (code) {
                      _phoneCode = code.toString();
                    },
                    showFlag: true,
                    flagWidth: 24,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    textStyle: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15),
                    showDropDownButton: false,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 16,
              child: AppTextInputField(
                hint: "00 000 0000",
                initialValue: "505236134",//TODO: this initial value is just for test purpose
                floatHint: false,
                keyboardType: TextInputType.phone,
                errorText: _phoneError,
                onUpdateInput: (value){
                  _phoneNumber = value;
                },
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 50,
        ),

        AppFilledButton(
            child: Text(
              letsGo.toUpperCase(),
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              if (_phoneNumber.isEmpty || !isValidPhoneNumber(_phoneCode+_phoneNumber)) {
                setState(() {
                  _phoneError = "Please enter valid phone number";
                });
              }else {
                setState(() {
                  _phoneError = null;
                });
              }
              if (_phoneCode.contains("+")) {
              _phoneCode =  _phoneCode.toString().substring(1,_phoneCode.length);
              }
              debugPrint("Full phone number -> ${_phoneCode+_phoneNumber}");
               context.read<SignInPhoneBloc>().add(
                    SubmitOtpRequest(fullPhoneNumber: _phoneCode+_phoneNumber));
            }),
        const SizedBox(
          height: 15,
        ),
        Text(
          byContinueAgreeWithTerms,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontSize: 14),
        )
      ],
    );
  }


  bool isValidPhoneNumber(String? value) =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(value ?? '');
}
