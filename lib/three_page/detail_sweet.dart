import 'package:eat_test/type.dart';
import 'package:flutter/material.dart';

var list_sweet = [
  def(data: 'ดื่มน้ำเปล่า กาแฟดำ ชาไม่ใส่น้ำตาลโซดา',),
  def(
      data:
          'ดื่มน้ำอัดลม กาแฟ 3 in 1 กาแฟเย็น กาแฟปั่น เครื่องดื่มชง น้ำหวาน นมเปรี้ยว',),
  def(data: 'ดื่มน้ำผัก ผลไม้สำเร็จรูป',),
  def(data: 'กินไอศกรีม เบเกอรี่ ขนมหวานไทย',),
  def(data: 'เติมน้ำตาล น้ำผึ้ง น้ำเชื่อม เพิ่มลงในอาหาร',),
];

class sweet extends StatefulWidget {
  final String ndef;
  const sweet({Key? key,required this.ndef}) : super(key: key);

  @override
  State<sweet> createState() => _sweetState();
}

class _sweetState extends State<sweet> {
  @override
  int _inputone = 0;
  int _n = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eating Health : ประเมินการบริโภคหวาน')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('หมายเหตุ',style: TextStyle(fontSize: 20)),
          Text('แทบจะไม่บริโภคหรือไม่บริโภคเลยเลือกหมายเลข 1',style: TextStyle(fontSize: 15)),
          Text('บริโภค 3-4 ครั้งต่อสปดาห์',style: TextStyle(fontSize: 15)),
          Text('บริโภคทุกวันหรือเกือบทุกวัน',style: TextStyle(fontSize: 15)),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                var st = list_sweet[i];
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              st.data,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      _buildButton(1),
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                ));
              },
              itemCount: list_sweet.length,
            ),
          ),
          if(_n>4)
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: Text(_get(_inputone),style: TextStyle(fontSize: 20.0),)),
            ),
          //Text(_inputone.toString()),
        ],
      ),
    );
  }

  Widget _buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          onPressed: () {
            setState(() {
                if(_n < 5){
                  _n++;
                  _inputone += num;
                }
            });
          },
          child: Text(num.toString())),
    );
  }
  dynamic _get(int mun){
    String sarn = '';
    if(mun<=5) {
      sarn = 'ยินดีด้วย คุณบริโภคน้ำตาลในปริมาณที่พอเหมาะ หากมีนิสัยในการบริโภคแบบนี้'
          'คุณจะมีความเสี่ยงต่ำในการมีรอบพุงเกิน เพราะน้ำตาลส่วนเกินเป็นสาเหตุหลักของการเกิด'
          'ไขมันสะสมนมีรอบพุงเกินปกติ';
    }
    if(mun>5 && mun<=9){
      sarn = 'คุณมีความเสี่ยงปานกลางในแง่ของพฤติกรรมการบริโภคน้ำตาล คนที่อยู่ในความเสี่ยงระดับนี้อาจเริ่มมีพุงแล้ว '
          'รวมถึงค่าดัชนีมวลกายอาจเริ่มเกินเกณฑ์มาตรฐานแล้ว (มากกว่า 22.9 กิโลกรัม/เมตร 2)';
    }
    if(mun>9 && mun<=13){
      sarn = 'คุณมีความเสี่ยงสูงในแง่ของพฤติกรรมการบริโภคน้ำตาล บอกได้คร่าวๆ เลยว่าคุณได้รับน้ำตาลสูงเกือบทุกวัน และเกินปริมาณที่แนะนำของกรมอนามัย '
          'กล่าวคือ คนไทยไม่ควรได้รับน้ำตาลเกินวันละ 6 ช้อนชาต่อวัน '
          'หากได้รับเกินจากนี้จะทำให้มีความเสี่ยงต่อการเกิดภาวะน้ำหนักเกินและเป็นต้นเหตุของการเกิดโรคเบาหวานได้มากกว่า 22.9 กิโลกรัม/เมตร 2';
    }
    if(mun>=13){
      sarn = 'รู้ตัวบ้างไหม? ว่าคุณมีความเสี่ยงสูงมาก กับการได้รับน้ำตาลเกินจนทำร้ายสุขภาพและร่างกายของตัวคุณเองเข้าแล้ว ปริมาณน้ำตาลที่คุณได้รับทั้งรู้ตัว '
          'ไม่รู้ตัวหรือไม่อยากจะรับรู้ก็ตาม อยู่ในปริมาณสูงมาก สูงพอที่จะทำให้คุณอ้วนและน้ำหนักตัวเพิ่มได้เดือนละ 1-2 กิโลกรัมเลยทีเดียว'
          ' ยังไม่รวมถึงความเสี่ยงในการเกิดโรคเบาหวาน โรคหัวใจและหลอดเลือด และโรคต่างๆ ที่ตามมาอีกขบวน';
    }
    return sarn;
  }
}
