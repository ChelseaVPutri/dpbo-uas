import 'package:dpbo/widget/category_model.dart';
import 'package:dpbo/models/recommended_newsletter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dpbo/service-selection-anorganik.dart';
import 'package:dpbo/sampah-organik.dart';
import 'notification.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage();
  
}

class _Homepage extends State<Homepage> {
  int selected_index = 0;
  List<CategoryModel> categories = [];
  List<RecNewsModel> newsletter = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  List<Widget> get screens => [
    ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        categoriesBar(),
        SizedBox(height: 30),
        recNewsletter(),
      ],
    ),
    HalamanSampahOrganik(),
    Placeholder(),
    Placeholder(),
  ];
  void onNavbarTapped(int index) {
    setState(() {
      selected_index = index;
    });
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    newsletter = RecNewsModel.getNews();
    
  }


  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavbarItem(CupertinoIcons.home, 'Beranda', 0),
            buildNavbarItem(CupertinoIcons.list_bullet, 'Riwayat', 1),
            buildNavbarItem(CupertinoIcons.doc_richtext, 'Newsletter', 2),
            buildNavbarItem(CupertinoIcons.person_solid, 'Profil', 3),
            ],
        ),
      ),
      backgroundColor: Colors.white,
      body: screens[selected_index]
      // Column(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(height: 20,),
      //     categoriesBar()
      //   ],
      // )
    );
  }

  Widget buildNavbarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => onNavbarTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected_index == index ? Color.fromRGBO(102, 160, 116, 1) : Colors.black87,
          ),
          Text(label, style: TextStyle(
            color: selected_index == index ? Color.fromRGBO(102, 160, 116, 1) : Colors.black87, 
          )),
        ],)
    );
  }

  Column recNewsletter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rekomendasi Newsletter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        ListView.separated(
          itemCount: newsletter.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 25,),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(newsletter[index].imagePath, fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsletter[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            );
          }
        )
      ],
    );
  }


  Column categoriesBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Kategori Sampah',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25,),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if(categories[index].name == 'Sampah Organik') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanSampahOrganik(),));
                  } else if(categories[index].name == 'Sampah Anorganik') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnorganikServiceSelection()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor, borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(3.5),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                )
              );
            }
          ),
        )

      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'EcoWaste',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Color.fromRGBO(102, 160, 116, 1),
      elevation: 0.0,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              height: 25,
              width: 25,
            ),
          ),
        )
      ],
    );
  }

}