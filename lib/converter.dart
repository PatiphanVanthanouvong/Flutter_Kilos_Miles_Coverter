import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConverterApp extends StatefulWidget {
  const ConverterApp({super.key});

  @override
  State<ConverterApp> createState() => _ConverterAppState();
}

enum Unit { Kilos, Miles }

class _ConverterAppState extends State<ConverterApp> {
  TextEditingController inputs = TextEditingController();
  
  Unit groupVal = Unit.Kilos;
  final double KilosToMile = 0.6213711922;
  final double MilesToKilos = 1.609344;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: Text(
          'Kilos & Miles Unit Converter',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              onChanged: (val) {
                if (inputs.text.isEmpty) {
                  setState(() {
                    inputs.clear();
                    result = 0;
                  });
                }
              },

               decoration: InputDecoration(
                 border: const UnderlineInputBorder(),
                    labelText: groupVal == Unit.Kilos
                        ? 'Enter your Kilometers'
                        : 'Enter your Mile'),
              controller: inputs,
            ),
            RadioListTile(
                title: Text('Change to Miles'),
                value: Unit.Kilos,
                groupValue: groupVal,
                onChanged: (val) {
                  setState(() {
                    groupVal = Unit.Kilos;
                    inputs.clear();
                    result = 0;
                  });
                }),
            RadioListTile(
                title: Text('Change to Kilos'),
                value: Unit.Miles,
                groupValue: groupVal,
                onChanged: (val) {
                  setState(() {
                    groupVal = Unit.Miles;
                    inputs.clear();
                    result = 0;
                  });
                }),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200], // background

                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    if (inputs.text.isNotEmpty) {
                      setState(() {
                        if (groupVal == Unit.Kilos) {
                          result = double.parse(inputs.text) * KilosToMile;
                        } else {
                          result = double.parse(inputs.text) * MilesToKilos;
                        }
                      });
                    }
                  },
                  child: Text('CALCULATE'),
                ),
              ),
            ),
            Text(
              '${result == 0.0 ? '' : '${inputs.text} ${groupVal == Unit.Kilos ? 'Kilos' : 'Miles'} = ${result} ${groupVal == Unit.Kilos ? 'Miles' : 'Kilos'}'}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )),
      ),
    );
  }
}
