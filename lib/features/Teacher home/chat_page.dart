import 'package:flutter/material.dart';
import 'package:stem_vault/Core/apptext.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Messages & Notifications",
          style: AppText.mainHeadingTextStyle().copyWith(fontSize: 24),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Message"),
            Tab(text: "Notification"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Center(child: Image.asset("assets/Images/No notification.png")),
              Center(child: Text("No message yet"))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Center(child: Image.asset("assets/Images/No notification.png")),
              Center(child: Text("No notification yet"))
            ],
          ),
        ],
      ),
    );
  }
}
