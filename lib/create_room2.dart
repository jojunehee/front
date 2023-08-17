import 'package:flutter/material.dart';
import 'main.dart'; // 메인 페이지에서 사용하는 클래스와 변수들 혹시 빠뜨릴까봐

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int? selectedDropdownValue; // 드롭다운에서 선택된 값을 저장하는 변수

  final TextEditingController _textFieldController =
      TextEditingController(); // 텍스트 필드의 값을 제어하기 위해서 씀

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('친구들과 오늘부터 같이 할 미션 방을 만들어주세요.'),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.amber),
              child: Text("사진 고르는 버튼"),
            ),
            Text('방 제목'),
            SizedBox(height: 5),
            TextField(
              controller: _textFieldController, // 텍스트 필드의 값을 컨트롤러와 연결
              maxLength: 15, // 최대 문자 길이 설정
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('미션 선택'),
                        SizedBox(height: 5),
                        DropdownButton<int>(
                          isExpanded: true,
                          value: selectedDropdownValue, // 현재 선택된 드롭다운 메뉴 값
                          items: [
                            DropdownMenuItem(child: Text('빨래'), value: 1),
                            DropdownMenuItem(child: Text('밥먹기'), value: 2),
                            DropdownMenuItem(child: Text('설거지하기'), value: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDropdownValue =
                                  value; // 드롭다운 메뉴에서 선택된 값 변경
                            });
                          },
                          hint: Text('미션을 선택해주세요'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [Text("인증시간"), Card()],
            ),
            SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  final textFieldValue =
                      _textFieldController.text; // 텍스트 필드의 값 가져옴
                  final result = ScreenArguments(
                      textFieldValue, selectedDropdownValue); // 결과 객체 생성
                  Navigator.pop(context, result); // 결과를 메인 페이지로 전달하며 페이지 닫기
                },
                child: Text('방 생성 완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
