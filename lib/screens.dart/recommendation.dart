import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({Key? key});

  @override
  State<RecommendationScreen> createState() => _DetectionResultState();
}

class _DetectionResultState extends State<RecommendationScreen> {
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                  child: Image.asset(
                    "Assets/Leaf_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container( 
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Expanded(
                child: Text(
                  "Best Crop",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(

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
