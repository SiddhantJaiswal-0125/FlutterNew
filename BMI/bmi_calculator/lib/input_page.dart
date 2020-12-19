import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusableCard.dart';
import 'Constants.dart';

enum Gender {
  male,
  female,
}

class inputpage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<inputpage> {
  Color maleCardColour = inactiveCard;
  Color femaleCardColour = inactiveCard;
  Gender selectedGender;
  int _curVal = 180;
  int Weight = 50;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: reusableCard(
                  colour: selectedGender == Gender.male
                      ? activeColour
                      : inactiveCard,
                  cardchild:
                      icon_content(data: 'Male', fi: FontAwesomeIcons.mars),
                  Onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: reusableCard(
                  colour: selectedGender == Gender.female
                      ? activeColour
                      : inactiveCard,
                  cardchild: icon_content(
                    data: 'Female',
                    fi: FontAwesomeIcons.venus,
                  ),
                  Onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: reusableCard(
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: label,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    //important error causing line
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _curVal.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: label,
                      ),
                    ],
                  ),
                  Slider(
                    value: _curVal.toDouble(),
                    min: 50.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        _curVal = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: reusableCard(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: label,
                        ),
                        Text(
                          Weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(Icons.remove, size: 35.0),
                              onpressed: () {
                                setState(() {
                                  Weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icon(
                                Icons.add,
                                size: 35.0,
                              ),
                              onpressed: () {
                                setState(() {
                                  Weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: label,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(Icons.remove, size: 35.0),
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icon(
                                Icons.add,
                                size: 35.0,
                              ),
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
                child: Text(
              'Result',
              style: TextStyle(
                fontSize: 24.0,
              ),
            )),
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Widget child;
  RoundIconButton({this.child, this.onpressed});
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      elevation: 2.0,
      shape: CircleBorder(),
      onPressed: onpressed,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
