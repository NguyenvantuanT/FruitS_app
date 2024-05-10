import 'package:flutter/material.dart';

class AppRow extends StatelessWidget {
  const AppRow({super.key, required this.text, required this.text2});

  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
           Row(
            children: [
              Text(text , style: const TextStyle(color: Colors.grey , fontSize: 18),),
              const  Spacer(),
              Text(text2 , style:const TextStyle(fontSize: 18),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_right , size: 20,))
            ],
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}
