import 'package:flutter/material.dart';

import '../type.dart';

var list_salty = [
  def(data: 'ชิมอาการก่อนปรุง',),
  def(
    data:
    'ใช้สมันไพรหรือเครื่องเทศเป็นส่วนประกอบอาหาร แทนเครื่องปรุง',),
  def(data: 'กินเนื้อสัตว์แปรรูป ไส้กรอก หมูยอ แฮม',),
  def(data: 'กินบะหมี่ โจ๊กสำเร็จรูป อาหารแช่แข็ง',),
  def(data: 'กินผักผลไม้ดอง ผลไม้แช่อิ่ม',),
];

class salty extends StatefulWidget {
  final String mdef;
  const salty({Key? key,required this.mdef}) : super(key: key);

  @override
  State<salty> createState() => _saltyState();
}

class _saltyState extends State<salty> {
  @override
  int _inputone = 0;
  int _n = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eating Health : ประเมินกาบริโภคโซเดียม'),backgroundColor: Colors.blueGrey),
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
                var st = list_salty[i];
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
              itemCount: list_salty.length,
            ),
          ),
          if(_n>4)
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: Text(_get(_inputone),style: TextStyle(fontSize: 20.0),)),
            ),
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
      sarn = 'ยินดีด้วยคุณได้รับโซเดียมในปริมาณที่น้อย ทำดีแล้วนะ แนะนำให้ปฏิบัติตัวแบบนี้ต่อไป';
    }
    if(mun>5 && mun<=9){
      sarn = 'คุณได้รับโซเดียมในระดับปานกลาง ยังถือว่าไม่มีอันตรายอะไรต่อสุขภาพ แต่คุณควรเริ่มตระหนักว่าไม่ควรบริโภคโซเดียมไปมากกว่านี้ ในวันหนึ่งเราไม่ควรบริโภคโซเดียมเกิน'
          ' 2,000 มิลลิกรัมหรือเท่ากับเกลือ 1 ช้อนชา เริ่มหันมาเอาใจใส่ตัวเองได้แล้วว่า '
          'ตัวเองอาจได้รับโซเดียมโดยไม่รู้ตัวหรือเปล่า หลีกเลี่ยงการปรุงรสชาติเพิ่มเติมโดยไม่ทันชิม และลดอาหารแปรรูปลงบ้างปฏิบัติตัวแบบนี้ต่อไป';
    }
    if(mun>9 && mun<=13){
      sarn = 'คุณได้รับโซเดียมในปริมาณสูงแน่ๆ ถึงเวลาตระหนักถึงพฤติกรรมการบริโภคได้แล้ว ไม่เช่นนั้นในอนาคตคุณต้องรับอุปการะโรคความดันโลหิตสูง'
          ' หรือโรคไตมาร่วมชีวิตใต้ชายคาเดียวกับคุณก็ได้คงถึงเวลาบอกเลิกอาหารแปรรูป การปรุงรสชาติอย่างไม่บันยะบันยังเสียที';
    }
    if(mun>=13){
      sarn = 'คุณได้รับโซเดียมสูงมาก แนะนำให้ปรับเปลี่ยนพฤติกรรมการบริโภคโดยด่วน หากคุณไม่อยากเป็นโรคความดันโลหิตสูง โรคไต และพรรคพวกที่เตรียมคร่าชีวิตคุณ'
          ' หากไม่รีบเปลี่ยนในตอนนี้อนาคตคุณอาจจะต้องไปโรงพยาบาลอาทิตย์ละ 3 – 4 ครั้ง เพื่อรับการฟอกไต เมื่อถึงเวลานั้นคุณจะไม่สามารถกินอาหารหลายๆ อย่างที่คุณชอบได้อย่างสบายใจอีกต่อไป'
          ' ต้องเลือกกินอาหารที่ยุ่งยากกว่านี้หลายเท่าตัวเพราะฉะนั้นเปลี่ยนแปลงตอนนี้ยังไม่สายที่จะทำ เน้นอาหารปรุงด้วยเครื่องเทศหรือสมุนไพร แต่ต้องไม่เผลอปรุงเค็ม';
    }
    return sarn;
  }
}
