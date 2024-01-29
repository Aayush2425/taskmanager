import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';

class Slide {
  Slide({
    required this.title,
  });

  final String title;
}

var slides = List.generate(
  5,
  (index) => Slide(
    title: 'assets/images/card${index + 1}.png',
  ),
);

final List<Widget> sliders = slides
    .map((item) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Image.asset(
            'assets/images/card1.png',
            fit: BoxFit.fill,
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      // color: Colors.black,

      alignment: Alignment.topLeft,
      child: FlutterCarousel(
        options: CarouselOptions(
          aspectRatio: 3/4,
          viewportFraction: .8,
          height: deviceSize.height * 0.35,

          indicatorMargin: 5.0,
          floatingIndicator: true,
          slideIndicator: CircularWaveSlideIndicator(
              currentIndicatorColor: Color.fromRGBO(58, 73, 249, 1),
              indicatorBackgroundColor: Colors.grey),
        ),
        items: sliders,
      ),
    );
  }
}

// class DemoItem extends StatelessWidget {
//   const DemoItem(this.title, this.route, {Key? key}) : super(key: key);
//
//   final String route;
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       child: Card(
//         color: Colors.blueAccent,
//         margin: const EdgeInsets.only(
//           bottom: 16.0,
//           left: 16.0,
//           right: 16.0,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 16.0,
//             horizontal: 16.0,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18.0,
//                   color: Colors.white,
//                 ),
//               ),
//               const Icon(Icons.arrow_forward_ios)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class CarouselDemoHome extends StatelessWidget {
//   const CarouselDemoHome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Carousel Demo',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24.0,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 600.0),
//           child: ListView(
//             shrinkWrap: true,
//             children: const [
//               SizedBox(height: 8.0),
//               DemoItem('Image Slider Demo', '/complicated'),
//               DemoItem('Enlarge Strategy Demo', '/enlarge'),
//               DemoItem('Manually Controlled Slider', '/manual'),
//               DemoItem('Fullscreen Carousel Slider', '/fullscreen'),
//               DemoItem('Carousel with Custom Indicator Demo', '/indicator'),
//               DemoItem('Multiple Item in One Screen Demo', '/multiple'),
//               DemoItem('Expandable Carousel Demo', '/expandable'),
//               DemoItem('Page Changed Reason Demo', "/page_changed_reason"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ManuallyControlledSlider extends StatefulWidget {
//   const ManuallyControlledSlider({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ManuallyControlledSliderState();
//   }
// }

// class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
//   final CarouselController _controller = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Manually Controlled Slider')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: FlutterCarousel(
//                   items: sliders,
//                   options: CarouselOptions(
//                     viewportFraction: 1.0,
//                     autoPlay: false,
//                     floatingIndicator: false,
//                     enableInfiniteScroll: true,
//                     controller: _controller,
//                     slideIndicator: CircularWaveSlideIndicator(),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16.0,
//                   vertical: 16.0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: ElevatedButton(
//                         onPressed: _controller.previousPage,
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Icon(Icons.arrow_back),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: ElevatedButton(
//                         onPressed: _controller.nextPage,
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Icon(Icons.arrow_forward),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
