import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
//모달에 인풋 부분 누르자마자 숫자패드가 뜨도록 하기 위해 필요한 것 같은데 실험이 안됨
import 'create_room2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> textFieldValues = [];
  List<int?> selectedDropdownValues = [];
  List<String> roomNames = [];

  TextEditingController _roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Page'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: textFieldValues.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${textFieldValues[index]}'),
                      Text('${selectedDropdownValues[index]}'),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    '/second',
                  ) as ScreenArguments;

                  if (result != null) {
                    setState(() {
                      textFieldValues.add(result.textFieldValue);
                      selectedDropdownValues.add(result.dropdownValue);
                    });
                  }
                },
                child: Text('방 생성'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showEnterRoomDialog();
                },
                child: Text('방 들어가기'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '참여코드 일단 저장되어 사용할 수 있다는 의미에서 목록으로 띄움',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: roomNames.map((roomName) => Text(roomName)).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEnterRoomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        bool isConfirmButtonEnabled = false; // 일단 비활성화로 시작

        return StatefulBuilder(
          builder: (context, setStateInside) {
            return AlertDialog(
              title: Text('참여코드'),
              content: TextField(
                controller: _roomNameController,
                decoration: InputDecoration(labelText: '참여코드 입력'),
                keyboardType: TextInputType.number,
                maxLength: 4,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  setStateInside(() {
                    // 현재 숫자 갯수 체크
                    isConfirmButtonEnabled = value.length == 4;
                  });
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('취소'),
                ),
                TextButton(
                  onPressed: isConfirmButtonEnabled
                      ? () {
                          setState(() {
                            roomNames.add(_roomNameController.text);
                            _roomNameController.clear();
                          });
                          Navigator.of(context).pop();
                        }
                      : null, // if절이 안맞으면 확인 버튼 비활성화
                  child: Text('확인'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class ScreenArguments {
  final String textFieldValue;
  final int? dropdownValue;

  ScreenArguments(this.textFieldValue, this.dropdownValue);
}
