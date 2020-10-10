// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthExample extends StatefulWidget {
  @override
  _LocalAuthExampleState createState() => _LocalAuthExampleState();
}

class _LocalAuthExampleState extends State<LocalAuthExample> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorizedHint = 'Not Authorized';
  bool _isAuthenticating = false;

  //canEvaluatePolicy
  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  //biometryType
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  //evaluatePolicy
  Future<void> _authenticate() async {
    print("驗證中");
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorizedHint = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          iOSAuthStrings: IOSAuthMessages(
            lockOut: "鎖",
            goToSettingsButton: "設定",
            goToSettingsDescription: "請設定",
            cancelButton: "算了"
          ),
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorizedHint = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print("例外");
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorizedHint = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {

    print("沒壞");

      return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Can check biometrics: $_canCheckBiometrics\n'),
                  RaisedButton(
                    child: const Text('Check biometrics'),
                    onPressed: _checkBiometrics,
                  ),
                  Text('Available biometrics: $_availableBiometrics\n'),
                  RaisedButton(
                    child: const Text('Get available biometrics'),
                    onPressed: _getAvailableBiometrics,
                  ),
                  Text('Current State: $_authorizedHint\n'),
                  RaisedButton(
                    child: Text(_isAuthenticating ? 'Cancel' : 'Authenticate'),
                    onPressed:
                    _isAuthenticating ? _cancelAuthentication : _authenticate,
                  )
                ]
            )
        )
      );
  }
}