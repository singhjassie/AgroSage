import 'package:flutter/material.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _DetectionResultState();
}

class _DetectionResultState extends State<RecommendationScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                  child: Image.asset(
                    "assets/images/leaf_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container( 
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Expanded(
                child: Text(
                  "Best Crop",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const SizedBox(

              height:350,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  "cdbsfhndshvkdjfbvkbvdsvkbshcfdhfbjbfdfjfdbjhfdhbfdghdughrduihgiuhgujdfhgifghifihnktfngjbrdhfvhdfvbrbdgurhdgldfndfnldnfkdjgfdkgnkdfgbdfjgbkdfdghfvjgkjkjkjhkkggbjbhkhidshlhllskcdhsksbfcsscvjsvcscsvchshcvscvsdhcvscjsvcsdvkscvsljcvslvjkcvkhdcdkabdielf;sde;lfhlgfksvdshgsavdlsfdvldfhfdfbjhsvdghqcfgwjdskfbfjgfihbkjfkjdbfljdnv;fmb;lfnlknlgml;lbfgkgerjfiuewgsvhgddfbdmnbfgjgnfbfhfvcjhdvbkdfnvflbgfmlhighirgtuyyguet4hsdbhsvdhcdvdfhgdshvshchdvjchfdkfvbdfkvbfkdvbdvbfdvbfdvbfvbfkbvfjkvbfkvnjfnlbgfnbngrbkfgvhjbvdlfnvtrjgihurgerblgrnbrjbntlnbkfngbknfvbldfbvldfvbfvkjdbfjvbkdfvbkdbbdjdbvjbdfjvjbfbdfvbdfvbdvc;vnvbdvdbv;ndfbvvjcxblvnclvbcvjblfvjdfihpjsvchvblkjcvbjcxvjcxvcxjvjxcvl",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
           
            
          ],
        )
      ),
    );
  }
}
