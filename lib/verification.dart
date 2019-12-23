import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:verification/size_config.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.screenHeight = MediaQuery.of(context).size.height;
    SizeConfig.screenWidth = MediaQuery.of(context).size.width;
    print(SizeConfig.txtMultiplier);
    print(SizeConfig.WidthMultiplier);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF1C5F96),
            Color(0xFF1074BC),
            Color(0xFF34AAFF),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.41 * SizeConfig.WidthMultiplier,
                  top: 1.22 * SizeConfig.HeightMultiplier,
                  bottom: 2.45 * SizeConfig.HeightMultiplier,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 5.43*SizeConfig.HeightMultiplier, // 30
                  child: _drawAppBar(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(2.89 * SizeConfig.WidthMultiplier),
                    topRight: Radius.circular(
                        2.89 * SizeConfig.WidthMultiplier), //12
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 6.76 * SizeConfig.WidthMultiplier,
                    right: 5.79 * SizeConfig.WidthMultiplier,
                    top: 3.34 * SizeConfig.HeightMultiplier,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _drawHeaderText(),
                        SizedBox(
                          height: 1.11 * SizeConfig.HeightMultiplier,
                        ),
                        _drawDescText(),
                        SizedBox(
                          height: 3.34 * SizeConfig.HeightMultiplier,
                        ),
                        _drawInputCode(),
                        SizedBox(
                          height: 16.74 * SizeConfig.HeightMultiplier,
                        ),
                        Center(
                          child: SizedBox(
                            width: 24 * SizeConfig.WidthMultiplier,
                            height: 2.4 * SizeConfig.HeightMultiplier,
                            child: InkWell(
                              onTap: () {
                                // Resend the code
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 1.20 * SizeConfig.WidthMultiplier,
                                  ),
                                  Text(
                                    'Resend',
                                    style: TextStyle(
                                      fontSize: 2.4 * SizeConfig.txtMultiplier,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.34 * SizeConfig.HeightMultiplier,
                        ),
                        _drawButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawAppBar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        Transform.translate(
          offset: Offset(24.15 * SizeConfig.WidthMultiplier, 0.0),
          child: Text(
            'Verification',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 2.56 * SizeConfig.txtMultiplier,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawHeaderText() {
    return Text(
      'Confirmation Code',
      style: TextStyle(
          fontSize: 2.4 * SizeConfig.txtMultiplier,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 0.3,),
    );
  }

  Widget _drawDescText() {
    return RichText(
      text: TextSpan(
        text: "We sent you a code to ",
        style: TextStyle(
          fontSize: 2.2 * SizeConfig.txtMultiplier,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
          color: Colors.grey,
        ),
        children: [
          TextSpan(
            text: "+41 (76) 558 77 76\n",
            style: TextStyle(
              fontSize: 2 * SizeConfig.txtMultiplier,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
              color: Color(0xFF0073F7),
            ),
          ),
          TextSpan(
            text: "Please write down.",
            style: TextStyle(
              fontSize: 2.2 * SizeConfig.txtMultiplier,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawInputCode() {
    return PinPut(
      fieldsCount: 4,
      textStyle: TextStyle(
        fontSize: 2.67 * SizeConfig.txtMultiplier,
        color: Colors.black,
      ),
      onSubmit: (String pin) => print('$pin'),
      actionButtonsEnabled: false,
      inputDecoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0073F7), width: 1.3),
        ),
      ),
    );
  }

  Widget _drawButton() {
    return Container(
      width: double.infinity,
      height: 6.8 * SizeConfig.HeightMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D9344),
            Color(0xFF48A240),
            Color(0xFF8BC63E),
          ],
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          splashColor: Colors.white30,
          child: Container(
            height: 6.69 * SizeConfig.HeightMultiplier,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 2.4 * SizeConfig.txtMultiplier,
                color: Colors.white,
                letterSpacing: 0.4,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
