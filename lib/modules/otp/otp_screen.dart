import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/modules/social_Register/cubit/Cubit.dart';
import 'package:kwader/modules/social_Register/cubit/States.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(129, 129, 129, 1.0)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return BlocConsumer<RegisterCubit,RegisterStates >(builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "رمز التحقق",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ادخل رمز التحقق المرسل لك",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
                  showCursor: true,
                  onCompleted: (pin) {
                    RegisterCubit.get(context).pin = pin;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: ()async {
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: RegisterCubit.get(context).virfyId!, smsCode:  RegisterCubit.get(context).pin!);
                        print(RegisterCubit.get(context).virfyId);
                        print(RegisterCubit.get(context).pin);
                        print(credential);
                        try{

                            await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            print('succses');
                          }catch(e){
                          print(e);
                        }
                        },
                      child: Text("ارسال")),
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
