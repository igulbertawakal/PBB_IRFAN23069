import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> chatList = [
    {
      'name': 'Bagus',
      'message': 'LOSERPOOL',
      'time': '11:30',
      'avatar': 'B',
      'imageUrl': 'https://picsum.photos/200?random=1',
    },
    {
      'name': 'Yepe',
      'message': 'Tenxi Ganteng',
      'time': '07:19',
      'avatar': 'Y',
      'imageUrl': 'https://picsum.photos/200?random=2',
    },
    {
      'name': 'Igoel',
      'message': 'Glory Glory Man United',
      'time': '08:45',
      'avatar': 'I',
      'imageUrl': 'https://picsum.photos/200?random=3',
    },
    {
      'name': 'Fufufafa',
      'message': 'mana 19 juta lapangan pekerjaan itu wo',
      'time': '19:20',
      'avatar': 'A',
      'imageUrl': 'https://picsum.photos/200?random=4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatItem(
            name: chatList[index]['name']!,
            message: chatList[index]['message']!,
            time: chatList[index]['time']!,
            avatar: chatList[index]['avatar']!,
            imageUrl: chatList[index]['imageUrl'],
            onTap: () {},
          );
        },
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final String? imageUrl;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.blue,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null ? Text(
          avatar,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ) : null,
      ),
      title: Text(
        name,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.grey[600],
          fontSize: 14,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: GoogleFonts.poppins(
          color: Colors.grey[500],
          fontSize: 12,
        ),
      ),
      onTap: () {
        // Aksi ketika chat diklik
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Chat dengan $name')),
        );
      },
    );
  }
}