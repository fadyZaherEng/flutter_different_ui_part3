import 'package:flutter/material.dart';
import 'package:flutter_diffrent_ui_part_3/modules/bubbles_chat/massage.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Massage> massages = [
    Massage(
        text:
            "Hi massages massages massages massages massages massages massages massages",
        dateTime: DateTime.now(),
        isSendByMe: false),
    Massage(
        text: "Hi kok kolkllk kkook",
        dateTime: DateTime.now(),
        isSendByMe: true),
    Massage(
        text: "Hi hi ll l llll", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(
        text: "Hi fady jjjjj kk kk k",
        dateTime: DateTime.now(),
        isSendByMe: true),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: true),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(
        text: "Hi",
        dateTime: DateTime.now().subtract(const Duration(minutes: 2)),
        isSendByMe: true),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: false),
    Massage(text: "Hi", dateTime: DateTime.now(), isSendByMe: true),
  ];

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Massage, DateTime>(
              reverse: true,
              order: GroupedListOrder.DESC,
              shrinkWrap: true,
              //scrollDirection: Axis.vertical,
              elements: massages,
              // groupComparator: (value1, value2) => value2.compareTo(value1),
              // itemComparator: (item1, item2) =>
              //     item1.text.compareTo(item2.text),
              groupBy: (massage) => DateTime(
                massage.dateTime.year,
                massage.dateTime.month,
                massage.dateTime.day,
              ),
              groupHeaderBuilder: (massage) {
                return SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(massage.dateTime),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemBuilder: (context, massage) {
                return buildMassage(massage, context);
              },
              useStickyGroupSeparators: true,
              padding: const EdgeInsets.all(8),
              floatingHeader: false,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Type your massage here...",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    controller: textController,
                    onFieldSubmitted: (text) {},
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        massages.add(
                          Massage(
                              text: textController.text,
                              dateTime: DateTime.now(),
                              isSendByMe: true),
                        );
                        textController.text = '';
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMassage(Massage massage, BuildContext context) {
    return Align(
      alignment:
          massage.isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            DateFormat.yMMMd().format(massage.dateTime),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 8,
              color: massage.isSendByMe
                  ? Colors.white
                  : Colors.purple.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  massage.text,
                  style: TextStyle(
                    color: massage.isSendByMe ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
