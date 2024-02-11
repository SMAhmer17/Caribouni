// ignore_for_file: prefer_const_constructors

import '../../../utils/app_export.dart';

class ChatWithUsScreen extends StatefulWidget {
  const ChatWithUsScreen({super.key});

  @override
  State<ChatWithUsScreen> createState() => _ChatWithUsScreenState();
}

class _ChatWithUsScreenState extends State<ChatWithUsScreen> {
  late TextEditingController messageController;

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: TextValue.chatwithUs,
      ),
      body: MainBackgroundWidget(
        sizes: sizes,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: double.infinity,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: messages.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return ChatListWidget(
                          isCaribouni: messages[index]["isCaribouni"],
                          message: messages[index]["message"],
                          dateTime: messages[index]["dateTime"],
                        );
                      }),
                ),
              ),
              // Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextBottomWidget(
                  // isSending:
                  //     controller.isSending.value,
                  controller: messageController,
                  onPressedSend: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List messages = [
    {
      "isCaribouni": true,
      "message": 'Hello John!',
      "dateTime": '18:32',
    },
    {
      "isCaribouni": true,
      "message": 'Please let me know how we can assist you.',
      "dateTime": '18:32',
    },
    {
      "isCaribouni": false,
      "message": 'I would buy ticket from event?',
      "dateTime": '18:32',
    },
    {
      "isCaribouni": true,
      "message":
          'Please let me know how we can assist you. hi hello how are you?',
      "dateTime": '18:32',
    },
    {
      "isCaribouni": false,
      "message":
          'Please let me know how we can assist you. hi hello how are you?',
      "dateTime": '18:32',
    },
  ];
}

class ChatListWidget extends StatelessWidget {
  final bool isCaribouni;
  final String message;
  final String dateTime;
  const ChatListWidget({
    super.key,
    this.isCaribouni = true,
    required this.message,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isCaribouni ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        SizedBox(
          width: isCaribouni ? 0 : 40,
        ),
        isCaribouni
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/flag_uae.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              )
            : Container(),
        SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(isCaribouni ? 15 : 0),
                    bottomLeft: Radius.circular(isCaribouni ? 0 : 15)),
                gradient: LinearGradient(colors: [
                  isCaribouni ? Colors.white : ColorConstant.cadmiumOrange,
                  isCaribouni ? Colors.white : ColorConstant.darkViolet
                ])),
            child: Column(
              crossAxisAlignment: isCaribouni
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Text(message,
                    style: AppStyle.txtRobotoRegular16SantaGrey(context)
                        .copyWith(
                            color: isCaribouni
                                ? ColorConstant.balticSea
                                : Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Text(dateTime,
                    style: AppStyle.txtRobotoRegular16SantaGrey(context)
                        .copyWith(
                            color: isCaribouni
                                ? ColorConstant.santaGrey
                                : Colors.white)),
              ],
            ),
          ),
        ),
        SizedBox(
          width: isCaribouni ? 30 : 0,
        )
      ],
    );
  }
}
