import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_code_camp/product.dart';

class Draft extends StatelessWidget {
  const Draft({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: Api.thum.map((url){
      return Builder(builder: (BuildContext context){
        return Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        );
      });
    }).toList(), options: CarouselOptions(
      height: 120.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16/9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      scrollDirection: Axis.horizontal,
    ),

    );

  }
}

// class Api {
//   List<Map<String, dynamic>> productData = [];
//   static List<String> thum = [];
//   static List<String> thum2 = [];
//
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('https://dummyjson.com/products'));
//     print(response);
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       if (jsonData.containsKey('products')) {
//         productData = List<Map<String, dynamic>>.from(jsonData['products']);
//
//         for (var product in productData) {
//           thum.add(product['thumbnail']); // Store thumbnail in thum
//
//           for (var imageUrl in product['images']) {
//             thum2.add(imageUrl); // Store other images in thum2
//           }
//         }
//       }
//     }
//   }
// }

