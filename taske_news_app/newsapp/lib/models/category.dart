class category_model{
  final String image; 
  final String title;
  
  category_model({required this.image,required this.title});
}
List<category_model>getcategories=
  [
  category_model(image: "images/Business.jpg", title: "business"),
  category_model(image: "images/Entertainment.jpg", title: "Entertainment"),
  category_model(image: "images/Health.jpg", title: "Health"),
  category_model(image: "images/Science.jpg", title: "Science"),
  category_model(image: "images/sport.jpg", title: "sport"),
  category_model(image: "images/Technology.jpg", title: "Technology"),
  category_model(image: "images/General.jpg", title: "General")

  ];

