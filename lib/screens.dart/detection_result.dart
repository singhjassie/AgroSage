import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetectionResult extends StatefulWidget {
  const DetectionResult({Key? key});

  @override
  State<DetectionResult> createState() => _DetectionResultState();
}

class _DetectionResultState extends State<DetectionResult> {
  
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
                  "Disease Name (40%)",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(

              height:300,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  "cdbsfhndshvkdjfbvkbvdsvkbshcfdhfbjbfdfjfdbjhfdhbfdghdughrduihgiuhgujdfhgifghifihnktfngjbrdhfvhdfvbrbdgurhdgldfndfnldnfkdjgfdkgnkdfgbdfjgbkdfdghfvjgkjkjkjhkkggbjbhkhidshlhllskcdhsksbfcsscvjsvcscsvchshcvscvsdhcvscjsvcsdvkscvsljcvslvjkcvkhdcdkabdielf;sde;lfhlgfksvdshgsavdlsfdvldfhfdfbjhsvdghqcfgwjdskfbfjgfihbkjfkjdbfljdnv;fmb;lfnlknlgml;lbfgkgerjfiuewgsvhgddfbdmnbfgjgnfbfhfvcjhdvbkdfnvflbgfmlhighirgtuyyguet4hsdbhsvdhcdvdfhgdshvshchdvjchfdkfvbdfkvbfkdvbdvbfdvbfdvbfvbfkbvfjkvbfkvnjfnlbgfnbngrbkfgvhjbvdlfnvtrjgihurgerblgrnbrjbntlnbkfngbknfvbldfbvldfvbfvkjdbfjvbkdfvbkdbbdjdbvjbdfjvjbfbdfvbdfvbdvc;vnvbdvdbv;ndfbvvjcxblvnclvbcvjblfvjdfihpjsvchvblkjcvbjcxvjcxvcxjvjxcvl",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
             SizedBox(height: 40,),
            ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorScheme.primary,
                                    
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Text(
                                    "Get AI Based Solution",
                                    style: TextStyle(
                                        color: colorScheme.onPrimary, fontSize: 16),
                                  )),
          ],
        )
      ),
    );
  }
}
