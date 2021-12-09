import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class inputpage extends StatefulWidget {
  const inputpage({Key? key}) : super(key: key);

  @override
  _inputpageState createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  Color c = Colors.grey;
  double sliderno = 160;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              NewWidget(
                colour: c,
                NewChild: detailwidget(icon: Icons.male, label: 'Male'),
              ),
              NewWidget(
                colour: c,
                NewChild: detailwidget(icon: Icons.female, label: 'Female'),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NewWidget(
                colour: c,
                NewChild: Container(
                  child: Column(
                    children: [
                      Text(sliderno.toString()),
                      SliderTheme(
                        data: SliderThemeData(
                            activeTrackColor: Colors.pink,
                            thumbColor: Color(0xffff00cc),
                            overlayColor: Color(0x1fff00cc),
                            inactiveTrackColor: Colors.grey.shade900,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 25),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 40)),
                        child: Slider(
                          value: sliderno.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double value) {
                            setState(
                              () {
                                sliderno = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              NewWidget(
                colour: c,
                NewChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight'),
                    //Text(weight.toString()),
                    Row(
                      children: [
                        Expanded(
                          child: roundbutton(
                            ic: Icons.add,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: roundbutton(
                            ic: Icons.add,
                            onpressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              NewWidget(
                colour: c,
                NewChild: detailwidget(icon: Icons.male, label: 'Male'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class roundbutton extends StatelessWidget {
  final IconData ic;
  final Function onpressed;
  roundbutton({required this.ic, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onpressed(),
      constraints: BoxConstraints.tightFor(height: 30, width: 30),
      child: Icon(ic),
      shape: CircleBorder(),
      fillColor: Colors.grey.shade300,
    );
  }
}

class detailwidget extends StatelessWidget {
  final IconData icon;
  final String label;
  detailwidget({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(label)],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final Color colour;
  final Widget NewChild;
  NewWidget({required this.colour, required this.NewChild});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: NewChild,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour,
          ),
        ),
      ),
    );
  }
}
