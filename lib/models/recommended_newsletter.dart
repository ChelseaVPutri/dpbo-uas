class RecNewsModel {
  String title;
  String imagePath;
  bool boxIsSelected;

  RecNewsModel({
    required this.title,
    required this.imagePath,
    required this.boxIsSelected
  });

  static List<RecNewsModel> getNews() {
    List<RecNewsModel> newsletter = [];

    newsletter.add(
      RecNewsModel(
        title: 'TITLE TITLE TITLE',
        imagePath: 'assets/images/placeholder.jpeg',
        boxIsSelected: false
      ),
    );

    newsletter.add(
      RecNewsModel(
        title: 'TITLE TITLE TITLE',
        imagePath: 'assets/images/placeholder.jpeg',
        boxIsSelected: false
      ),
    );

    newsletter.add(
      RecNewsModel(
        title: 'TITLE TITLE TITLE',
        imagePath: 'assets/images/placeholder.jpeg',
        boxIsSelected: false
      ),
    );
    return newsletter;
  }
}