import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TagType { food, market, delivery, booking }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 0, 5),
        child: Column(
          children: [
            _title(),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    TagType type;
                    switch (index) {
                      case 0:
                        type = TagType.food;
                        break;
                      case 1:
                        type = TagType.market;
                        break;
                      case 2:
                        type = TagType.delivery;
                        break;
                      case 3:
                        type = TagType.booking;
                        break;
                      case 4:
                        type = TagType.food;
                        break;
                      case 5:
                        type = TagType.market;
                        break;
                      case 6:
                        type = TagType.delivery;
                        break;
                      case 7:
                      default:
                        type = TagType.food;
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: _customer(type: type),
                        ),
                        const Text(
                          "+10 điểm",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    );
                  },
                  itemCount: 8),
            )
          ],
        ));
  }
}

Widget _title() {
  return 
    Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
      child: Row(
        children: [
          Text("Lịch sử điểm",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Spacer(),
          Row(
            children: [
              Text(
                "Xem thêm",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward_ios_sharp)
            ],
          )
        ],
      )
    );
}

Widget _customer({required TagType type}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            //width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: _tagColor(type),
            ),
            child: Row(
              children: [
                _tagIcon(type),
                SizedBox(width: 6),
                Text(_tagText(type))
              ],
            ),
          ),
          Text("#250324-123456", style: TextStyle(fontSize: 18))
        ],
      ),
      Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [Text("11:45"), SizedBox(width: 6), Text("28/08/2024")],
        ),
      )
    ],
  );
}

Color _tagColor(TagType type) {
  if (type == TagType.food) {
    return Colors.redAccent;
  }
  if (type == TagType.market) {
    return Colors.blue;
  }
  if (type == TagType.booking) {
    return Colors.yellow;
  }
  if (type == TagType.delivery) {
    return Colors.deepOrange;
  }
  return Colors.lightBlueAccent;
}

String _tagText(TagType type) {
  if (type == TagType.food) {
    return 'Đồ ăn';
  }
  if (type == TagType.market) {
    return 'Đi chợ';
  }
  if (type == TagType.booking) {
    return 'Đặt xe';
  }
  if (type == TagType.delivery) {
    return 'Giao Hàng';
  }
  return '';
}

Icon _tagIcon(TagType type) {
  if (type == TagType.food) {
    return Icon(Icons.ac_unit_sharp);
  }
  if (type == TagType.market) {
    return Icon(Icons.account_balance_outlined);
  }
  if (type == TagType.booking) {
    return Icon(Icons.phone);
  }
  if (type == TagType.delivery) {
    return Icon(Icons.accessible_forward_sharp);
  }
  return Icon(Icons.help);
}
