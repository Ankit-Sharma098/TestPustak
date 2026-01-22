import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Dummy notification list (Future me Firebase/API se aayega)
    final List<Map<String, String>> notifications = [
      {
        "title": "New Course Update 🎉",
        "message": "Java DSA new lecture uploaded. Check it now!",
        "time": "2 min ago",
      },
      {
        "title": "Test Series Live ✅",
        "message": "SSC GD mock test is now available.",
        "time": "1 hour ago",
      },
      {
        "title": "Daily Current Affairs 📰",
        "message": "Today's current affairs PDF is uploaded.",
        "time": "Yesterday",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Clear all feature coming soon ✅"),
                ),
              );
            },
          )
        ],
      ),

      // ✅ If list empty then show "No notifications"
      body: notifications.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_off, size: 70, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "No notifications yet 🔔",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "You will receive course updates here.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.notifications),
              ),
              title: Text(
                item["title"] ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(item["message"] ?? ""),
              ),
              trailing: Text(
                item["time"] ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Opened: ${item["title"]}"),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
