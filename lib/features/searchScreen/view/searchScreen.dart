import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  final FocusNode focusNode;
  const SearchScreen({Key? key, required this.focusNode}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[200],
                child: TextField(
                  autofocus: true,
                  focusNode: widget.focusNode,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: GoogleFonts.getFont('Poppins', fontSize: 18),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Search History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      5, // Change this to your actual search history list length
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Search History Item ${index + 1}'),
                      onTap: () {
                        // Handle tapping on search history item
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Discover More',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      5, // Change this to your actual discover more list length
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Discover More Item ${index + 1}'),
                      onTap: () {
                        // Handle tapping on discover more item
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
