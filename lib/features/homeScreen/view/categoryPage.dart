import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/widgets/categories.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailPage extends StatefulWidget {
  static const routeName = '/categorydetail';
  final int currentCategory;
  CategoryDetailPage({required this.currentCategory});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final appTheme = ThemeData(
    primarySwatch: Colors.red,
  );
  int item = 0;

  List<bool> selected = [true, false, false, false, false];
  List<IconData> icon = [
    Icons.local_florist, // Fresh Fruits
    Icons.eco, // Organic Fruits
    Icons.wb_sunny, // Seasonal Fruits
    Icons.food_bank, // Dried Fruits
    Icons.card_giftcard, // Gift Baskets
  ];

  List<Color> colors = [
    Colors.lightGreen[200]!, // Fresh Fruits
    Colors.lightBlueAccent[200]!, // Organic Fruits
    Colors.orangeAccent[100]!, // Seasonal Fruits
    Colors.amber[200]!, // Dried Fruits
    Colors.purpleAccent[100]!, // Gift Baskets
  ];
  List<String> fruitCategories = [
    'Fresh',
    'Organic',
    'Seasonal',
    'Dried',
    'Gift',
    'Bulk',
  ];
  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
    // Navigator.of(context).pushNamed(routes[n]);
    setState(() {
      item = n + 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    select(widget.currentCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          fruitCategories[widget.currentCategory],
          style: GoogleFonts.getFont('Poppins', fontSize: 23),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Row(
          children: [
            Material(
              elevation: 35,
              color: Colors.white70,
              child: Container(
                width: 70.0,
                // decoration: BoxDecoration(
                //   color: Colors.white30,
                //
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: icon
                      .asMap()
                      .entries
                      .map(
                        (entry) => NavBarItem(
                          icon: entry.value,
                          color: colors[entry.key],
                          selected: selected[entry.key],
                          onTap: () {
                            setState(() {
                              select(entry.key);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Categories(itemCount: item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final Function onTap;
  final bool selected;
  final Color color;

  NavBarItem({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.selected,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  late Animation<double> _anim1;
  late Animation<double> _anim2;
  late Animation<double> _anim3;
  late Animation<Color?> _color;

  bool hovered = false;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 275),
    );

    _anim1 = Tween(begin: 101.0, end: 75.0).animate(_controller1);
    _anim2 = Tween(begin: 101.0, end: 25.0).animate(_controller2);
    _anim3 = Tween(begin: 101.0, end: 50.0).animate(_controller2);
    _color = ColorTween(end: Color(0xff332a7c), begin: Colors.white)
        .animate(_controller2);

    _controller1.addListener(() {
      setState(() {});
    });
    _controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(NavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.selected) {
      Future.delayed(Duration(milliseconds: 10), () {
        //_controller1.reverse();
      });
      _controller1.reverse();
      _controller2.reverse();
    } else {
      _controller1.forward();
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 10), () {
        //_controller2.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            hovered = false;
          });
        },
        child: Container(
          width: 101.0,
          color:
              hovered && !widget.selected ? Colors.white12 : Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  child: CustomPaint(
                    painter: CurvePainter(
                      value1: 0,
                      animValue1: _anim3.value,
                      animValue2: _anim2.value,
                      animValue3: _anim1.value,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 80.0,
                  width: 101.0,
                  child: Center(
                    child: Icon(
                      widget.icon,
                      color: Colors.green[800],
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double value1; // 200
  final double animValue1; // static value1 = 50.0
  final double animValue2; //static value1 = 75.0
  final double animValue3; //static value1 = 75.0

  CurvePainter({
    required this.value1,
    required this.animValue1,
    required this.animValue2,
    required this.animValue3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(101, value1);
    path.quadraticBezierTo(101, value1 + 20, animValue3,
        value1 + 20); // have to use animValue3 for x2
    path.lineTo(animValue1, value1 + 20); // have to use animValue1 for x
    path.quadraticBezierTo(animValue2, value1 + 20, animValue2,
        value1 + 40); // animValue2 = 25 // have to use animValue2 for both x
    path.lineTo(101, value1 + 40);

    path.moveTo(101, value1 + 80);
    path.quadraticBezierTo(101, value1 + 60, animValue3, value1 + 60);
    path.lineTo(animValue1, value1 + 60);
    path.quadraticBezierTo(animValue2, value1 + 60, animValue2, value1 + 40);
    path.lineTo(101, value1 + 40);

    paint.color = Colors.white;
    paint.strokeWidth = 101.0;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
