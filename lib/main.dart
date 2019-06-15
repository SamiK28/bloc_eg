import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bloc.dart';

void main() => runApp(MaterialApp(
      title: 'bloc',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bloc=Bloc();
  int check=0;
  List<MaterialColor> colors= [Colors.red,Colors.yellow,Colors.orange,Colors.green,];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: bloc.op,
      initialData: Colors.red,
      builder: (context, snapshot) {
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
                    onTap: ()=>bloc.ip.add(colors[i]),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: snapshot.data.toString()==colors[i].toString()?Border.all(color: Colors.blue,width: 10):null,
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
          backgroundColor: snapshot.data,
        );
      }
    );
  }
   @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
