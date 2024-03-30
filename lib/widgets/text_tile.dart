import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    super.key,
    required this.title,
    required this.description,
    required this.image_path,
    required this.destination,
  });
  final String title;
  final String description;
  final String image_path;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => destination));
        },
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              // color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.onSurface.withOpacity(.5))),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image_path,
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(colors: [
                      colorScheme.background,
                      colorScheme.background,
                      colorScheme.background,
                      colorScheme.background.withOpacity(0),
                    ])),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              softWrap: true,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onBackground.withOpacity(.9),
                              ),
                            ),
                            const SizedBox(height: 12,),
                            Text(
                              description,
                              style: TextStyle(
                                color: colorScheme.onBackground.withOpacity(.8),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
