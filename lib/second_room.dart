import 'package:flutter/material.dart';

class RoomMakePage extends StatefulWidget {
  @override
  State<RoomMakePage> createState() => _RoomMakePageState();
}

class _RoomMakePageState extends State<RoomMakePage> {
  int _year = 1;
  int _month = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              '$_year년 $_month월',
              style: TextStyle(color: Colors.black),
            ),
            Expanded(child: SizedBox()),
            //캘린더 여는 버튼
          ],
        ),
        backgroundColor: Color(0xffF2F4F6),
      ),
      body: DynamicButtonList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 눌렸을때 실행될 코드
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class TaskList extends StatefulWidget {
//   @override
//   _TaskListState createState() => _TaskListState();
// }

// class _TaskListState extends State<TaskList> {
//   List<Task> tasks = [];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: tasks.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(tasks[index].title),
//         );
//       },
//     );
//   }
// }

class DynamicButtonList extends StatelessWidget {
  final int buttonCount = 5; // 데이터에 따른 버튼 갯수 설정

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.builder(
          itemCount: buttonCount,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // 버튼이 클릭되었을 때 실행되는 코드
                _showAddTaskDialog(context);
              },
              child: Text('$index'),
            );
          },
        ),
      ],
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('할 일 추가'),
          content: TextField(
              // 할 일을 입력받는 텍스트 필드
              ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // 할 일 목록에 추가하는 로직
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('추가'),
            ),
          ],
        );
      },
    );
  }
}
