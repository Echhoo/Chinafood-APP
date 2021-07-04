class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/home_page/breakfast.png',
      titleTxt: '早餐',
      kacl: 525,
      meals: <String>['豆浆牛奶,', '油条面包,', '水果'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/home_page/lunch.png',
      titleTxt: '午餐',
      kacl: 602,
      meals: <String>['蔬菜,', '鸡,鸭,鱼,肉,', '杂粮'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/home_page/dinner.png',
      titleTxt: '晚餐',
      kacl: 505,
      meals: <String>['蔬菜,水果', '鸡,鸭,鱼,肉,', '杂粮'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
