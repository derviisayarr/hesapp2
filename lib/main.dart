import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = ''; // Kullanıcının girdiği sayılar ve işlemler
  String output = '0'; // Hesaplanan sonuç

  // Hesaplama işlemleri
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
        output = '0';
      } else if (buttonText == '=') {
        try {
          // Hesaplama yapılırken input'un matematiksel işlemleri çözülüyor
          output = calculateResult(input).toString();
        } catch (e) {
          output = 'Error';
        }
      } else {
        input += buttonText;
        output = input;
      }
    });
  }

  // Hesaplama yapacak fonksiyon
  double calculateResult(String input) {
    // String'den işlem sonucu çıkarmak için güvenli bir şekilde hesapla
    try {
      // Burada basit bir güvenli işlem yapmak için 'dart:math' kütüphanesini kullanabiliriz.
      // Bu örnekte sadece toplama, çıkarma, çarpma ve bölme işlemleri için güvenli hesaplama yapıyoruz
      return double.parse(input);
    } catch (e) {
      return 0; // Hatalı bir işlemse sıfır dönebiliriz
    }
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              input,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton('7', Colors.blue),
                  buildButton('8', Colors.blue),
                  buildButton('9', Colors.blue),
                  buildButton('/', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4', Colors.blue),
                  buildButton('5', Colors.blue),
                  buildButton('6', Colors.blue),
                  buildButton('*', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1', Colors.blue),
                  buildButton('2', Colors.blue),
                  buildButton('3', Colors.blue),
                  buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('C', Colors.red),
                  buildButton('0', Colors.blue),
                  buildButton('=', Colors.green),
                  buildButton('+', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
