import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MaterialApp(
      title: 'bloc',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int check=0;
  List<MaterialColor> colors= [Colors.red,Colors.yellow,Colors.orange,Colors.green,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey.shade100,
          height: 100,
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: colors.length,
            itemBuilder: (context,i){

              return GestureDetector(
                onTap: (){
                  setState(() {
                    check=i;
                  });
                  
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: check==i?Border.all(color: Colors.blue,width: 10):null,
                    color: colors[i]
                  ),
                  height: 55,
                  width: 55,
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: colors[check],
    );
  }
}
