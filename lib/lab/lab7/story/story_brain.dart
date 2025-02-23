import 'story.dart';

class StoryBrain {
  List<Story> _storyData = [
    Story(
        storyTitle:
        'Xe của bạn bị nổ lốp trên một con đường quanh co giữa nơi hoang vắng, không có sóng điện thoại. Bạn quyết định xin đi nhờ. Một chiếc xe bán tải cũ kỹ dừng lại bên cạnh bạn. Một người đàn ông đội mũ rộng vành với đôi mắt vô hồn mở cửa xe và hỏi: "Cậu có cần đi nhờ không?".',
        choice1: 'Tôi sẽ lên xe. Cảm ơn vì đã giúp đỡ!',
        choice2: 'Tốt hơn là hỏi xem ông ta có phải kẻ giết người không.'),
    Story(
        storyTitle: 'Ông ta gật đầu chậm rãi, không hề nao núng trước câu hỏi.',
        choice1: 'Ít nhất thì ông ta cũng trung thực. Tôi sẽ lên xe.',
        choice2: 'Khoan đã, tôi biết cách thay lốp xe.'),
    Story(
        storyTitle:
        'Khi xe bắt đầu lăn bánh, người lạ mặt bắt đầu nói về mối quan hệ của ông ta với mẹ mình. Ông ta ngày càng trở nên tức giận. Ông ta yêu cầu bạn mở hộp đựng đồ. Bên trong, bạn thấy một con dao dính máu, hai ngón tay bị cắt lìa và một cuốn băng cassette của Elton John. Ông ta đưa tay về phía hộp đựng đồ.',
        choice1: 'Tôi thích Elton John! Đưa ông ta cuốn băng cassette.',
        choice2: 'Hoặc là ông ta, hoặc là mình! Bạn cầm lấy con dao và đâm ông ta.'),
    Story(
        storyTitle:
        'Cái gì? Thật là một quyết định tệ hại! Bạn có biết tai nạn giao thông là nguyên nhân tử vong do tai nạn đứng thứ hai đối với hầu hết các nhóm tuổi trưởng thành không?',
        choice1: 'Chơi lại',
        choice2: ''),
    Story(
        storyTitle:
        'Khi bạn đâm xuyên qua lan can và lao xuống những tảng đá sắc nhọn bên dưới, bạn chợt nhận ra rằng việc đâm ai đó khi họ đang lái chiếc xe mà bạn đang ngồi có vẻ không phải là một quyết định sáng suốt.',
        choice1: 'Chơi lại',
        choice2: ''),
    Story(
        storyTitle:
        'Bạn và kẻ sát nhân cùng hòa giọng trong ca khúc "Can You Feel the Love Tonight". Ông ta thả bạn xuống thị trấn tiếp theo. Trước khi đi, ông ta hỏi bạn có biết nơi nào tốt để vứt xác không. Bạn đáp: "Thử ra bến tàu xem".',
        choice1: 'Chơi lại',
        choice2: '')
  ];


  int _storyNumber = 0;

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }
}