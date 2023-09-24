import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  // 非同期関数になったため返り値の型にFutureが月、さらに async キーワードが追加されました
  Future<void> fetchImages() async {
    // await で待つことで Future が外れ Response 型のデータを受け取ることができました。
    Response response = await Dio().get(
      'https://pixabay.com/api/?key=4433277-ceb45a4ecca782feef50a80be&q=yellow+flowers&image_type=photo&pretty=true',
    );
    print(response.data);
  }

  @override
  void initState() {
    super.initState();
    // 最初に一度だけ画像データを取得します
    fetchImages();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}