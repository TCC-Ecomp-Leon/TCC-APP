import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  final String label;
  final Widget callbackPage;
  const AddCard({
    required this.callbackPage,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 60.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => callbackPage,
          ),
        );
      },
      child: Card(
        color: Colors.green,
        child: Container(
          height: 70.0,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
