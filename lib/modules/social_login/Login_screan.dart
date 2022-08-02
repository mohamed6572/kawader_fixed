import 'package:buildcondition/buildcondition.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/Home_layout.dart';
import 'package:kwader/modules/social_Register/Register_Screan.dart';
import 'package:kwader/modules/social_login/cubit/Cubit.dart';
import 'package:kwader/modules/social_login/cubit/States.dart';
import 'package:kwader/shared/components/components.dart';
import 'package:kwader/shared/network/local/casheHelper.dart';

class LoginScrean extends StatelessWidget {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSucsesState ){
            casheHelper.SavaData(
                key: 'uIdd', value: state.uId
            )
                .then((value) {
              navigateToAndFinish(context, Home_Layout());
            });

          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('assets/images/logo.jpeg')),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'تسجيل دحول'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        Text(
                          'سجل الدخول الان لترى العروض الخاصه بنا',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if(state is LoginerrorState)
                          Text('الايميل او الباسورد غير صحيحين يرجى المراجعة ',style: TextStyle(color: Colors.red,fontSize: 14),),

                        SizedBox(
                          height: 15,
                        ),


                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              showFlagMain: true,
                              initialSelection: 'OM',
                              showCountryOnly: true,
                              alignLeft: true,
                            countryFilter: <String>['OM', 'SA', 'qa', 'KW'],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child:
                            defultFormField(
                              type: TextInputType.phone,
                              controller: phoneController,
                              label: '+00000000',

                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please Enter phone number';
                                }
                                return null;
                              },
                            ),

                          )
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        defultFormField(
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            label: 'كلمه السر',
                            suffix: LoginCubit.get(context).suffix,
                            isPassword:
                                LoginCubit.get(context).isPassword,
                            onSubmeted: (value) {
                              if (formkey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    email: '${phoneController.text}@gmail.com',
                                    password: passwordController.text
                                );
                              }
                            },
                            passwordShow: () {
                              LoginCubit.get(context)
                                  .ChangePasswordVisibilty();
                            },
                            prefix: Icons.lock_outline,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        BuildCondition(
                          condition: state is! LoginLodingState,
                          builder: (context) => defultButton(
                            text: 'تسجيل الدخول',
                            isUpperCase: true,
                            function: () {
                              if (formkey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    email:'${phoneController.text}@gmail.com',
                                    password: passwordController.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ليس لديك حساب ?'),
                            defultTextButtton(
                                text: 'انشاء حساب',
                                function: () {
                                  navigateTo(context, RegisterScrean());
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
