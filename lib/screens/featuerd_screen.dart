
import 'package:educate/constants/color.dart';
import 'package:educate/constants/size.dart';
import 'package:educate/models/category.dart';
import 'package:educate/widgets/circle_button.dart';
import 'package:educate/widgets/search_testfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'course_screen.dart';



class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  String mainProfilePic =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3tX9GUY0RJdxvyvuX0zIx_PHafgmoLdm5Lg&usqp=CAU";
  String otherProfilePic =
      "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/368-mj-2516-02.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f3d0ad657bbca1c0f2db36ad7deb323";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Navigation Drawer"),
          ),
          drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.blue.withOpacity(.6),
              ),
              child: Drawer(
                  child: ListView(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountName: Text("John Doe"),
                        accountEmail: Text("johndoe@email.com"),
                        currentAccountPicture: GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(mainProfilePic),
                            ),
                            onTap: () => print("Current User")),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("images/bcinmg.jpg"),
                                fit: BoxFit.cover
                            )
                          // color: Colors.lightGreenAccent,
                        ),
                      ),
                      ListTile(
                          title: Text("Home Page"),
                          trailing: Icon(Icons.menu),
                          onTap: () {
                            Navigator.of(context).pop();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (BuildContext context) =>
                            //       Loginpage(),
                            // ));
                          }),
                      ListTile(
                          title: Text("About Page"),
                          trailing: Icon(Icons.info),
                          onTap: () {
                            Navigator.of(context).pop();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (BuildContext context) =>
                            //       HomePage(),
                            // ));
                          }),
                      ListTile(
                          title: const Text("Settings Page"),
                          trailing: const Icon(Icons.security),
                          onTap: () {
                            Navigator.of(context).pop();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (BuildContext context) =>
                            //       MyHomePage(),
                           // ));
                          }),
                      const Divider(
                        thickness: 10.0,
                      ),
                      ListTile(
                        title: Text("Close"),
                        leading: Icon(Icons.cancel),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  )
              )
          ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              // AppBar(
              //
              // ),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Categories",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 24,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CourseScreen(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
                height: kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

// class AppBar extends StatelessWidget {
//    AppBar(
//
//       {
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//
//       padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//       height: 130,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(10),
//           bottomRight: Radius.circular(10),
//         ),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.1, 0.5],
//           colors: [
//             Color(0xff886ff2),
//             Color(0xff6849ef),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               // Icon(Icons.menu
//               //
//               //
//               // ),
//               // CircleButton(
//               //   icon: Icons.notifications,
//               //   onPressed: () {},
//               // ),
//             ],
//           ),
//           // const SizedBox(
//           //   height: 20,
//           // ),
//         //  const SearchTextField()
//
//         ],
//       ),
//
//     );
//
//
//   }
// }
