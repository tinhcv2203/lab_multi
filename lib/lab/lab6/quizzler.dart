import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lab_multi/lab/lab6/questions.dart';
import 'package:lab_multi/lab/lab7/boss_level_challenge.dart';
import 'package:lab_multi/lab/lab5/xylophone.dart';
class Quizzler extends StatefulWidget {
  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<Quizzler> {
  final tickIcon = const Icon(Icons.check, color: Colors.green);
  final crossIcon = const Icon(Icons.clear, color: Colors.red);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Một số con mèo thực sự bị dị ứng với con người.', true),
    Question('Bạn có thể dắt một con bò đi xuống cầu thang nhưng không thể đi lên.', false),
    Question('Khoảng một phần tư số xương của con người nằm ở bàn chân.', true),
    Question('Máu của ốc sên có màu xanh lá cây.', true),
    Question('Tên thời con gái của mẹ Buzz Aldrin là "Moon" (Mặt Trăng).', true),
    Question('Đi tiểu xuống biển ở Bồ Đào Nha là hành vi phạm pháp.', true),
    Question('Không có tờ giấy vuông khô nào có thể gấp đôi nhiều hơn 7 lần.', false),
    Question('Ở London, Anh, nếu bạn qua đời trong tòa nhà Quốc hội, về mặt kỹ thuật bạn sẽ được tổ chức tang lễ cấp quốc gia, vì tòa nhà này được coi là nơi linh thiêng.', true),
    Question('Âm thanh lớn nhất do một loài động vật tạo ra là 188 decibel. Đó là tiếng kêu của voi châu Phi.', false),
    Question('Tổng diện tích bề mặt của hai lá phổi con người xấp xỉ 70 mét vuông.', true),
    Question('Google ban đầu có tên gọi là "Backrub".', true),
    Question('Sô cô la ảnh hưởng đến tim và hệ thần kinh của chó; chỉ một vài gram cũng đủ để giết chết một con chó nhỏ.', true),
    Question('Ở West Virginia, Mỹ, nếu bạn vô tình đâm phải một con vật trên đường, bạn có thể mang nó về nhà để ăn.', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        appBar: AppBar(
          title: Text("Quizzler"),
          backgroundColor: Colors.green[600],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Xylophone()), // Quay lại Xylophone
              );
            },
          ),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
              child: Text(
                questionsList[count].question,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Đúng',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.green
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Sai',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.red
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),
            Row(children: iconsList),
            SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () => Get.to(() => BossLevelChallenge()),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[600],
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Boss Level Challenge',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      setState(() {
        iconsList.add(tickIcon);
        if (count < questionsList.length - 1) count++;
      });
    } else {
      setState(() {
        iconsList.add(crossIcon);
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
