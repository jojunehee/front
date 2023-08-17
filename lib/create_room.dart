import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // 로고 이미지 또는 아이콘을 여기에 추가
            // 예: Image.asset('로고 이미지 경로'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), // 햄버거 아이콘
            onPressed: () {
              // 드로우바 열기 로직 구현
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Placeholder(
            // 사진이 없을 때 띄워주는 사진을 대체
            fallbackHeight: 200,
            fallbackWidth: double.infinity,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 첫 번째 버튼 눌렀을 때의 동작
                },
                child: Text('버튼 1'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // 두 번째 버튼 눌렀을 때의 동작
                },
                child: Text('버튼 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
