import 'package:dpbo/widget/category_model.dart';
import 'package:dpbo/models/recommended_newsletter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dpbo/service-selection-anorganik.dart';
import 'package:dpbo/sampah-organik.dart';
import 'notification.dart';
import '../profile.dart';

class Homepage extends StatefulWidget {
  // final String username;
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
        SizedBox(height: 30)
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
            buildNavbarItem(CupertinoIcons.person_solid, 'Profil', 2),
            ],
        ),
      ),
      backgroundColor: Colors.white,
      body: screens[selected_index]
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