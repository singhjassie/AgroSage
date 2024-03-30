import 'package:flutter/material.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({super.key, required this.imageUrl, required this.categoryName});
  final String imageUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName), // Set app bar title to category name
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
        child: Column(
          children: [
          
            Center(
              child: Container(
                width: 190.0,
                height: 190.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), 
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56.0), 

            // Product details section
            const Column( 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Divider(),
                // Product Name
                Text(
                  'Product Name',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),

                // Brand Name
                Text(
                  'Brand Name',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 13.0),
                // Weight 
                Text(
                  'Weight: 234gm',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 9.0),
                //Price 
                Text(
                  'Price: Rs234',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Divider(),
                // Description
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Color– Light Green To Red \nFruit Length– 8 To 11 Cm \nFruit Width– 2.5 To 3 Cm \nPungency– Intermediate \nPlant Length– 125 To 130 Cm \nMaturity– 60 To 65 Days (After Sowing) \nDisease Tolerance – Pm, Virus, Sucking Pests. \nRemark:- Achari Variety, Good For Processing And Suitable For Rainy Season. \nAddress of origin: New Delhi, DELHI, 110007",
                  style: TextStyle(fontSize: 16.0,
                  height: 1.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
