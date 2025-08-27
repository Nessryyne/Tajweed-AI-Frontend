part of '../forgot_password_datasource.dart';

ForgotPasswordModelResponse _mockRequestResetCodeSuccess() =>
    ForgotPasswordModelResponse(
      success: true,
      info: "RESET_CODE_SENT",
      token: "1234567890",
    );

ForgotPasswordModelResponse _mockVerifyCodeSuccess() =>
    ForgotPasswordModelResponse(
      success: true,
      info: "CODE_VERIFIED",
      token: "1234567890",
    );

ResetPasswordModelResponse _mockResetPasswordSuccess() =>
    ResetPasswordModelResponse(
      success: true,
      info: "PASSWORD_RESET_SUCCESSFUL",
    );
