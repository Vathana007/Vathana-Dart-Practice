import 'package:flutter/material.dart';

// List of images
List<String> images = [
  "assets/W4-S2/bird.jpg",
  "assets/W4-S2/bird2.jpg",
  "assets/W4-S2/insect.jpg",
  "assets/W4-S2/girl.jpg",
  "assets/W4-S2/man.jpg",
];

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex = 0;

  // Go back to previous image
  void previousImg() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = images.length - 1; 
      }
    });
  }

  // Go to next image
  void nextImg() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImg, 
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImg, 
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          images[currentIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,  // Why this line ? Can you explain it ?
      home: ImageViewer(),
    ));
