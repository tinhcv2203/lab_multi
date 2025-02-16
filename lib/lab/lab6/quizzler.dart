import 'package:flutter/material.dart';
import 'package:lab_multi/lab/lab6/questions.dart';

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<Quizzler> {
  final tickIcon = const Icon(Icons.check, color: Colors.green);
  final crossIcon = const Icon(Icons.clear, color: Colors.red);
  int count = 0;
  //List of Icons which is added to the bottom of the screen
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Một số con mèo thực sự bị dị ứng với con người.', true),
    Question('Bạn có thể dắt một con bò đi xuống cầu thang nhưng không thể đi lên.', false),
    Question('Khoảng một phần tư số xương của con người nằm ở bàn chân.', true),
    Question('Máu của ốc sên có màu xanh lá cây.', true),
    Question('Tên thời con gái của mẹ Buzz Aldrin là "Moon" (Mặt Trăng).', true),
    Question('Đi tiểu xuống biển ở Bồ Đào Nha là hành vi phạm pháp.', true),
    Question(
        'Không có tờ giấy vuông khô nào có thể gấp đôi nhiều hơn 7 lần.', false),
    Question(
        'Ở London, Anh, nếu bạn qua đời trong tòa nhà Quốc hội, về mặt kỹ thuật bạn sẽ được tổ chức tang lễ cấp quốc gia, vì tòa nhà này được coi là nơi linh thiêng.', true),
    Question(
        'Âm thanh lớn nhất do một loài động vật tạo ra là 188 decibel. Đó là tiếng kêu của voi châu Phi.', false),
    Question(
        'Tổng diện tích bề mặt của hai lá phổi con người xấp xỉ 70 mét vuông.', true),
    Question('Google ban đầu có tên gọi là "Backrub".', true),
    Question(
        'Sô cô la ảnh hưởng đến tim và hệ thần kinh của chó; chỉ một vài gram cũng đủ để giết chết một con chó nhỏ.', true),
    Question(
        'Ở West Virginia, Mỹ, nếu bạn vô tình đâm phải một con vật trên đường, bạn có thể mang nó về nhà để ăn.', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: _body(),
      ),
    );
  }

  _body() {
    ///
    /// Column1
    ///
    return Column(
      // Divide the the vertical space between the children
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      // Stretch the children horizontally to the screen size
      // as we need to stretch the buttons
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Center(

          ///
          /// Text Widget with some padding
          ///
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
              child: Text(
                questionsList[count].question,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),

        ///
        /// Column2
        ///
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///
            /// True Button
            ///
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Đúng',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black, // Shadow color
                  elevation: 5, // Elevation of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                  backgroundColor: Colors.green
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),

            ///
            /// To give some space between buttons
            ///
            SizedBox(height: 8),

            ///
            /// False Button
            ///
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Sai',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black, // Shadow color
                  elevation: 5, // Elevation of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                  backgroundColor: Colors.red
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),

            ///
            /// Row for Tick-Cross Icons to align them horizontally.
            ///
            Row(children: iconsList)
          ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      //Correct answer

      setState(() {
        iconsList.add(tickIcon);

        // Check if don't cross list size limit which will result in error
        if (count < questionsList.length - 1) count++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconsList.add(crossIcon);

        // Check if don't cross list size limit which will result in error
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}