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
