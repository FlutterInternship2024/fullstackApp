import 'package:flutter/cupertino.dart';

class DashboardCard extends StatefulWidget {
  final Color containerColor;
  final IconData icon;
  final String headingText;
  final String subText1;
  final String subText2;
  final Color textColor;

  const DashboardCard({
    Key? key,
    required this.containerColor,
    required this.textColor,
    required this.icon,
    required this.headingText,
    required this.subText1,
    required this.subText2,
  }) : super(key: key);

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              widget.headingText,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  widget.icon,
                  color: widget.textColor,
                  size: 25,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subText1,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: widget.textColor,
                    ),
                  ),
                  Text(
                    widget.subText2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: widget.textColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
