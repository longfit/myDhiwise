import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/guest_login_model.dart';
import 'provider/guest_login_provider.dart';

class GuestLoginScreen extends StatefulWidget {
  const GuestLoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  GuestLoginScreenState createState() => GuestLoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GuestLoginProvider(),
      child: GuestLoginScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GuestLoginScreenState extends State<GuestLoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 23.v,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "lbl_email".tr,
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Selector<GuestLoginProvider, TextEditingController?>(
                    selector: (context, provider) => provider.emailController,
                    builder: (context, emailController, child) {
                      return CustomTextFormField(
                        controller: emailController,
                        hintText: "msg_enter_your_email".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(height: 19.v),
                  _buildInputColumn(context),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 6.h),
                      child: Text(
                        "msg_forgot_password".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.v),
                  CustomElevatedButton(
                    text: "lbl_sign_in".tr,
                  ),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 12.v,
          bottom: 17.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "msg_login_as_a_guest".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildInputColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_password".tr,
          style: CustomTextStyles.bodyLargeOnPrimaryContainer,
        ),
        SizedBox(height: 5.v),
        Consumer<GuestLoginProvider>(
          builder: (context, provider, child) {
            return CustomTextFormField(
              controller: provider.passwordController,
              hintText: "lbl_enter_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: InkWell(
                onTap: () {
                  provider.changePasswordVisibility();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgEyeOutline,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 44.v,
              ),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: provider.isShowPassword,
              contentPadding: EdgeInsets.only(
                left: 12.h,
                top: 12.v,
                bottom: 12.v,
              ),
            );
          },
        )
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
