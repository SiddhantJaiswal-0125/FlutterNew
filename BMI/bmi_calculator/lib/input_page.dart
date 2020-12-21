import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusableCard.dart';
import 'Constants.dart';
import 'resultpage.dart';
import 'Calculator.dart';

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

  double height = 4.0;
  double htinMtr = 1;

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
                    'HEIGHT ( in Foot )',
                    style: label,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    //important error causing line
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsPrecision(2),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'ft',
                        style: label,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 3.0,
                    max: 10.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    divisions: 70,
                    label: htinMtr.toStringAsPrecision(3) + ' Meter',
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue;
                        htinMtr = (height * 0.3048);
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
                          'WEIGHT (in kg) ',
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
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height: htinMtr, weight: Weight);

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return resultpage(
                      bmiResult: calc.calculateBMI(),
                      interpretation: calc.Interpetation(),
                      restext: calc.getResult(),
                      sy: calc.symbol());
                },
              ));
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  style: KResult,
                ),
              ),
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
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
