import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_wor/theme/themeprov.dart';
class settingapage extends StatelessWidget {
  const settingapage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text('DARCK MODE',style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: (){
                    Provider.of<themeprov>((context),listen: false).setto(0);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //vilote
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:const Color.fromRGBO(0x99, 0x97, 0xBC, 1.0)
                    ),
                    child: const Center(child: Text('vilote',style: TextStyle(color: Color.fromRGBO(0xfe, 0xe9, 0xce, 1.0)),)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: (){
                    Provider.of<themeprov>((context),listen: false).setto(2);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //blue
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:const Color.fromRGBO(0x54, 0x83, 0xb3, 1.0)
                    ),
                    child: const Center(child: Text('blue',style: TextStyle(color: Color.fromRGBO(0xc1, 0xe8, 0xff, 1.0)),)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: (){
                    Provider.of<themeprov>((context),listen: false).setto(1);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //purple
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:const Color.fromRGBO(0x6d, 0x3c, 0x52, 1.0)
                    ),
                    child: const Center(child: Text('purple',style: TextStyle(color: Color.fromRGBO(0xfa, 0xdc, 0xd5, 1.0)),)),//Color(0xfadcd5)
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: (){
                    Provider.of<themeprov>((context),listen: false).setto(3);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //golden
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:const Color.fromRGBO(0xe0, 0x91, 0x45, 1.0)
                    ),
                    child: const Center(child: Text('golden',style: TextStyle(color: Color.fromRGBO(0xfc, 0xd9, 0xb8, 1.0)),)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: (){
                    Provider.of<themeprov>((context),listen: false).setto(4);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //bandw
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:const Color.fromRGBO(153, 153, 161, 1)
                    ),
                    child: const Center(child: Text('B&W',style: TextStyle(color: Color.fromRGBO(0xf4, 0xf4, 0xf6, 1.0)),)),//Color(0xf4f4f6)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
