class UnbordingContent {
  String image1;
  String image2;
  String image3;
  String title;
  String discription;
  String text2;
  String text3;

  UnbordingContent({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.title,
    required this.discription,
    required this.text2,
    required this.text3,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Explore Real Estate',
    image1: 'assets/images/onboarding_screen_assets/background_image1.png',
    image2: 'assets/images/onboarding_screen_assets/Group_1.png',
    image3: '',
    discription:
        "Stay informed with the fastest and most effective way, wherever you are",
    text2: 'Buy or Rent',
    text3: 'Real Estate',
  ),
  UnbordingContent(
    title: 'Book a ticket',
    image1: 'assets/images/onboarding_screen_assets/background_image2.png',
    image2: 'assets/images/onboarding_screen_assets/Group_2.png',
    image3: 'assets/images/onboarding_screen_assets/Women_Khaliji-01.png',
    discription:
        "You can book ticket attractions and get experience a new place like never before",
    text2: 'Restaurants',
    text3: 'Attractions',
  ),
  UnbordingContent(
    title: 'Discover Amazing Place',
    image1: 'assets/images/onboarding_screen_assets/background_image3.png',
    image2: 'assets/images/onboarding_screen_assets/Group_3.png',
    image3: 'assets/images/onboarding_screen_assets/character_man-06.png',
    discription:
        "Plan Your Journey, choose your destination to Restaurants, Party Club… and much more, Pick the best plan for your holiday",
    text2: 'Night Life',
    text3: 'Events',
  ),
];
