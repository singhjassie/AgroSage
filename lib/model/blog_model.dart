class Blog {
  final String title;
  final String description;
  final String coverUrl;
  final String cropUrl;


  Blog({
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.cropUrl,
  });

  static List<Blog> blogs = [
    Blog(
      title: 'Law',
      description: 'India ',
      coverUrl: 'assets/images/wheat.jpg',
      cropUrl:'https://images.pexels.com/photos/974314/pexels-photo-974314.jpeg?auto=compress&cs=tinysrgb&w=300',
    ),
    Blog(
      title: 'law',
      description: 'Agri',
      coverUrl: 'assets/images/wheat.jpg',
      cropUrl:'https://images.pexels.com/photos/974314/pexels-photo-974314.jpeg?auto=compress&cs=tinysrgb&w=300',

    ),
    Blog(
      title: 'law',
      description: '3 law',
      coverUrl: 'assets/images/wheat.jpg',
      cropUrl:'https://images.pexels.com/photos/974314/pexels-photo-974314.jpeg?auto=compress&cs=tinysrgb&w=300',

    )
  ];
}