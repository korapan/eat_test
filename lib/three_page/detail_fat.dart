import 'package:flutter/material.dart';

import '../type.dart';

var list_fat = [
  def(data: 'เลือกกินเนื้อสัตว์ติดมัน ติดหนัง มีไขมันแทรก',),
  def(
    data:
    'กินอาหารทอด อาหารฟาสฟู้ด อาหารผัดน้ำมัน',),
  def(data: 'กินอาหารจานเดียวไขมันสูงหรืออาหารประเภทแกงกะทิ',),
  def(data: 'ดื่มเครื่องดื่มที่ชงผสมนมข้นหวาน ครีมเทียม วิปปิ้งครีม',),
  def(data: 'ซดน้ำผัด น้ำแกงหรือน้ำผัด',),
];

class fat extends StatefulWidget {
  final String edef;
  const fat({Key? key,required this.edef}) : super(key: key);

  @override
  State<fat> createState() => _fatState();
}

class _fatState extends State<fat> {
  @override
  int _inputone = 0;
  int _n = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eating Health : ประเมินการบริโภคไขมัน'),backgroundColor: Colors.deepPurple),
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
                var st = list_fat[i];
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
              itemCount: list_fat.length,
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Center(
                child: SizedBox(
                  child: Text(
                    'ต่อไป',
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              color: Colors.blue,
              width: 100.0,
              height: 70.0,
            ),
          ),*/
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
      sarn = 'คุณมีความเสี่ยงน้อยในการได้รับผลเสียจากการบริโภคไขมันไม่เหมาะสม หากคุณอยู่ในกลุ่มนี้เป็นไปได้ว่าคุณเป็นคนรักสุขภาพ'
          ' มักจะไม่เกิดโรคที่เกิดจากการบริโภคไขมัน ชีวิตของคุณมีแนวโน้มว่าจะยืนนาน หากคุณบริโภคในส่วน อื่นๆ เหมาะสมด้วย';
    }
    if(mun>5 && mun<=9){
      sarn = 'คุณมีความเสี่ยงปานกลางในการเลือกบริโภคไขมัน คนที่อยู่ในความเสี่ยงระดับนี้อาจเริ่มมีพุงน้อยๆ หรือเริ่มปานกลางแล้ว'
          ' รวมถึงค่าดัชนีมวลกายอาจเริ่มเกินเกณฑ์มาตรฐานแล้ว (มากกว่า 22.9 กิโลกรัม/เมตร 2)';
    }
    if(mun>9 && mun<=13){
      sarn = 'คุณมีความเสี่ยงสูงในการเลือกบริโภคไขมัน อาจบอกได้คร่าวๆ เลยว่าคุณบริโภคปริมาณไขมันเกินเกือบทุกวัน หากอ้างอิงจากคนที่ต้องการพลังงานวันละ 1,600 kcal ต่อวัน '
          'คนเหล่านี้ ไม่ควรได้รับน้ำมันเกิน 3 ช้อนโต๊ะต่อวัน หากได้รับเกินจากนี้จะทำให้มีความเสี่ยงต่อการเกิดภาวะน้ำหนักเกิน'
          ' โรคไขมันในเลือดสูง โรคหัวใจและหลอดเลือด ภาวะสมองขาดเลือดเฉียบพลัน (Stroke) และภาวะต่างๆที่พร้อมจะสูบเงินในกระเป๋าคุณไปเป็นค่ารักษาโรค';
    }
    if(mun>=13){
      sarn = 'เงื้อมมือมัจจุราช!!!!  คุณมีพฤติกรรมการบริโภคไขมันที่อันตรายต่อชีวิตอันมีค่าของคุณมากคุณมีความเสี่ยงสูงมากที่จะมีภาวะไขมันสูงในเลือด ไขมันพอกที่อวัยวะต่างๆ'
          ' และอาจเริ่มเกิดการอุดตันของไขมันในเส้นเลือดไปแล้วก็ได้ เป็นไปได้ว่าอนาคตจะเกิดการแตกของเส้นเลือดและนำไปสู่ภาวะStroke ได้ ถ้าโชคดีอาจรอดชีวิตแต่เป็นอัมพาต '
          'ยิ่งถ้าโชคร้ายละก็จะเป็นการจบชีวิตแบบไม่ได้ตั้งตัว (ทุกๆ 3 - 4 นาทีจะมีผู้เสียชีวิตจากภาวะStroke 1 ราย)  '
          'แนะนำว่าคุณควรรีบเปลี่ยนพฤติกรรมการบริโภคเดี๋ยวนี้ และออกกำลังกายเพิ่มขึ้นด้วย';
    }
    return sarn;
  }
}
