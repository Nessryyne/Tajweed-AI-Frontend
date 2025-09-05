part of '../sign_in_datasource.dart';

/// Creates mock sign in data
///
Map<String, dynamic> _mockSignInWithEmailAndPassword() => {
  "success": true,
  "info": "Sign in successful",
  "data": {
    "access": "mock_access_token_123",
    "refresh": "mock_refresh_token_456",
  },
};

/// Creates mock social login data
///
Map<String, dynamic> _mockSocialLogin() => {
  "success": true,
  "info": "Social login successful",
  "data": {
    "access": "mock_social_access_token_789",
    "refresh": "mock_social_refresh_token_012",
  },
};
