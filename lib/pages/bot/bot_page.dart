import 'dart:async';
import 'dart:io';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dash_chat/dash_chat.dart';

class BotPage extends StatefulWidget {
  const BotPage({Key key}) : super(key: key);

  @override
  _BotPageState createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  final _chatCambiadoStreamController =
      StreamController<List<ChatMessage>>.broadcast();
  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Bot",
    uid: "25649654",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;
  Dialogflow dialogflow;
  AuthGoogle authGoogle;
  @override
  void initState() {
    super.initState();
    initializeDialogflow();
  }

  /// Auth and initialize the dialogflow services
  void initializeDialogflow() async {
    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/credentials/botybuy-bot-srrn-bd58f9935dfc.json")
        .build();
    dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.spanish);
  }

  fetchFromDialogFlow(String input) async {
    AIResponse response = await dialogflow.detectIntent(input);
    print(response.getMessage());
    final String textResponse = response.getMessage();
    //si la respuesta es un solo mensaje
    if (textResponse != null) {
      messages.add(ChatMessage(
          text: textResponse, user: ChatUser(name: 'Bot', uid: '25649654')));
      _chatCambiadoStreamController.sink.add(messages);
      
    } else {
      //si la respuesta son varios mensajes
      final List<dynamic> listResponse = response.getListMessage();
       for (var message in listResponse) {
         Map<String,dynamic> messageSubText= message['text'];
      messages.add(ChatMessage(
      text:messageSubText['text'][0], user: ChatUser(name: 'Bot', uid: '25649654')));
     _chatCambiadoStreamController.sink.add(messages);
    }
    }

   
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        if (_chatViewKey.currentState != null) {
          _chatViewKey.currentState?.scrollController
            ..animateTo(
              _chatViewKey
                  .currentState?.scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
        }
      });
    });
  }

  void onSend(ChatMessage message) {
    print(messages);
    print(message.toJson());
    messages.add(message);
    _chatCambiadoStreamController.sink.add(messages);
    fetchFromDialogFlow(message.text);
    // FirebaseFirestore.instance
    //     .collection('messages')
    //     .doc(DateTime.now().millisecondsSinceEpoch.toString())
    //     .set(message.toJson());
    /* setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BotyBuy"),
      ),
      body: StreamBuilder<List<ChatMessage>>(
          stream: _chatCambiadoStreamController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              addInitialMessage();
              print('added initial message');
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              );
            } else {
              this.messages = snapshot.data;
              //var messages =
              //    items.map((i) => ChatMessage.fromJson(i.data()?i.data():[])).toList();
              return DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: onSend,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState?.scrollController
                      ..animateTo(
                        _chatViewKey.currentState?.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    if (i == 0) {
                      systemMessage();
                      Timer(Duration(milliseconds: 600), () {
                        systemMessage();
                      });
                    } else {
                      systemMessage();
                    }
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                showTraillingBeforeSend: true,
                // trailing: <Widget>[
                //   IconButton(
                //     icon: Icon(Icons.photo),
                //     onPressed: () async {
                //       final picker = ImagePicker();
                //       PickedFile result = await picker.getImage(
                //         source: ImageSource.gallery,
                //         imageQuality: 80,
                //         maxHeight: 400,
                //         maxWidth: 400,
                //       );

                //       // if (result != null) {
                //       //   final Reference storageRef =
                //       //       FirebaseStorage.instance.ref().child("chat_images");

                //       //   final taskSnapshot = await storageRef.putFile(
                //       //     File(result.path),
                //       //     SettableMetadata(
                //       //       contentType: 'image/jpg',
                //       //     ),
                //       //   );

                //       //   String url = await taskSnapshot.ref.getDownloadURL();

                //       //   ChatMessage message =
                //       //       ChatMessage(text: "", user: user, image: url);

                //       //   FirebaseFirestore.instance
                //       //       .collection('messages')
                //       //       .add(message.toJson());
                //       // }
                //     },
                //   )
                // ],
              );
            }
          }),
    );
  }

  void addInitialMessage() {
    List<ChatMessage> initialList = [];
    initialList.add(ChatMessage(
        text: 'Hola, bienvenido a botybuy! ',
        user: ChatUser(name: 'Bot', uid: '25649654')));
    _chatCambiadoStreamController.sink.add(initialList);
  }
}
