import 'package:eat_test/three_page/detail_dalty.dart';
import 'package:eat_test/three_page/detail_fat.dart';
import 'package:eat_test/three_page/detail_sweet.dart';
import 'package:flutter/material.dart';

var the_list = [
  'ประเมินการบริโภคหวาน',
  'ประเมินการบริโภคโซเดียม',
  'ประเมินการบริโภคไขมัน',
];

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: const Text('Eating Health'),backgroundColor: Colors.red),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: Text('แบบประเมินพฤติกรรมการบริโภคอาหาร หวาน มัน เค็ม',
                    style: TextStyle(fontSize: 40.0)))
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                var st = the_list[i];
                return Card(
                    child: InkWell(
                      onTap: () {
                        if(i==0) {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => sweet(ndef: st))
                          );
                        }
                        if(i==1) {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => salty(mdef: st))
                          );
                        }if(i==2) {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => fat(edef: st))
                          );
                        }
                      },
                      child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                st,
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                  ),
                ),
                    ));
              },
              itemCount: the_list.length,
            ),
          ),
        ],
      ),
    );
  }
}
