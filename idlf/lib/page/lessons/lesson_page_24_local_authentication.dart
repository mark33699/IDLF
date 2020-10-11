import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LessonPageLocalAuthentication extends StatefulWidget {
  @override
  _LessonPageLocalAuthenticationState createState() => _LessonPageLocalAuthenticationState();
}

class _LessonPageLocalAuthenticationState extends State<LessonPageLocalAuthentication> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final LocalAuthentication _localAuth = LocalAuthentication();
  String _canEvaluatePolicy = "";
  String _biometryType = "";

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    canCheckBiometrics = await _localAuth.canCheckBiometrics;

    if (!mounted) return;

    setState(() {
      _canEvaluatePolicy = canCheckBiometrics ? "是" : "否";
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    availableBiometrics = await _localAuth.getAvailableBiometrics();

    if (!mounted) return;

    setState(() {
      if (availableBiometrics.isEmpty) {
        _biometryType = "不支援";
      } else {
        switch (availableBiometrics.first) {
          case BiometricType.face:
            _biometryType = "點我驗證Face ID";
            break;
          case BiometricType.fingerprint:
            _biometryType = "點我驗證Touch ID";
            break;
          default:
            _biometryType = "不支援";
            break;
        }
      }
    });
  }

  Future<void> _authenticate() async {
    print("驗證中");
    bool authenticated = false;

    try {
      authenticated = await _localAuth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          stickyAuth: true,
          useErrorDialogs: false,
          iOSAuthStrings: IOSAuthMessages(
              lockOut: "鎖",
              goToSettingsButton: "設定",
              goToSettingsDescription: "請設定",
              cancelButton: "算了"
          )
      );
    } on PlatformException catch (e) {
      print("例外");
      print(e);
    }

    if (!mounted) return;

    final result = authenticated ? "驗證成功" : "驗證失敗";
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(result)));

  }

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Local Authentication"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 100),
                Text("您的裝置是否支援生物辨識：$_canEvaluatePolicy"),
                OutlineButton(
                    child: Text(_biometryType),
                    onPressed: _biometryType == "不支援" ? null : _authenticate
                )
              ],
            )
        )
    );
  }
}