// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
//
// class ExtrasPage extends StatelessWidget {
//   const ExtrasPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> _imagePaths = [
//       'assets/images/pic1.jpg',
//       'assets/images/pic2.jpg',
//       'assets/images/pic3.jpg',
//       'assets/images/pic4.jpg',
//       'assets/images/pic5.jpg',
//       'assets/images/pic6.jpg',
//       'assets/images/pic7.jpg',
//     ];
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/bg1.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           // Main Content
//           SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//
//                 // Title
//                 Text(
//                   'Power FM Extras',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 10.0,
//                         color: Colors.black.withOpacity(0.5),
//                         offset: const Offset(2.0, 2.0),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Carousel Slider for Images
//                 CarouselSlider.builder(
//                   itemCount: _imagePaths.length,
//                   itemBuilder: (context, index, realIndex) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         image: DecorationImage(
//                           image: AssetImage(_imagePaths[index]),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     );
//                   },
//                   options: CarouselOptions(
//                     height: 200,
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                     aspectRatio: 16/9,
//                     viewportFraction: 0.8,
//                     scrollPhysics: BouncingScrollPhysics(),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Slider for controlling playback
//                 Slider(
//                   value: 20,
//                   min: 0,
//                   max: 100,
//                   divisions: 5,
//                   label: "Player",
//                   onChanged: (double value) {
//                     // Handle slider value changes
//                   },
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Button Row for Back, Play, and Next
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Back Button
//                     IconButton(
//                       icon: const Icon(Icons.skip_previous_outlined, size: 40, color: Colors.white),
//                       onPressed: () {
//                         // Handle back action
//                       },
//                     ),
//
//                     const SizedBox(width: 20),
//
//                     // Play Button
//                     FloatingActionButton(
//                       backgroundColor: Colors.white,
//                       onPressed: () {
//                         // Handle play action
//                       },
//                       child: const Icon(
//                         Icons.play_arrow_rounded,
//                         size: 40,
//                         color: Colors.greenAccent,
//                       ),
//                     ),
//
//                     const SizedBox(width: 20),
//
//                     // Next Button
//                     IconButton(
//                       icon: const Icon(Icons.skip_next_outlined, size: 40, color: Colors.white),
//                       onPressed: () {
//                         // Handle next action
//                       },
//                     ),
//                   ],
//                 ),
//
//                 const Spacer(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';

class ExtrasPage extends StatelessWidget {
  const ExtrasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/pic1.jpg',
      'assets/images/pic2.jpg',
      'assets/images/pic3.jpg',
      'assets/images/pic4.jpg',
      'assets/images/pic5.jpg',
      'assets/images/pic6.jpg',
      'assets/images/pic7.jpg',
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                // Title
                Text(
                  'Power FM Extras',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Custom Carousel using PageView
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: imagePaths.length,
                    controller: PageController(viewportFraction: 0.8),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 60),

                // Slider for controlling playback
                Slider(
                  value: 20,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: "Player",
                  onChanged: (double value) {
                    // Handle slider value changes
                  },
                ),

                const SizedBox(height: 40),

                // Button Row for Back, Play, and Next
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Back Button
                    IconButton(
                      icon: const Icon(Icons.skip_previous_outlined, size: 40, color: Colors.white),
                      onPressed: () {
                        // Handle back action
                      },
                    ),

                    const SizedBox(width: 20),

                    // Play Button
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        // Handle play action
                      },
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 40,
                        color: Colors.greenAccent,
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Next Button
                    IconButton(
                      icon: const Icon(Icons.skip_next_outlined, size: 40, color: Colors.white),
                      onPressed: () {
                        // Handle next action
                      },
                    ),
                  ],
                ),

                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
