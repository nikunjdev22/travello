import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import 'package:travello/View/controller/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            IconButton(
                onPressed: () => AuthController.instance.logout(),
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: Obx(() => homeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: homeController.productData?.products?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(20),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Image.network(homeController
                              .productData!.products![index].thumbnail
                              .toString(),
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                homeController
                                    .productData!.products![index].title
                                    .toString() ,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Container(height: 10),
                              Text(homeController
                                    .productData!.products![index].description
                                    .toString() ,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  const Spacer(),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.transparent,
                                    ),
                                    child: const Text(
                                      "SHARE",
                                      style: TextStyle(color: AppColors.primary),
                                    ),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.transparent,
                                    ),
                                    child: const Text(
                                      "EXPLORE",
                                      style: TextStyle(color: AppColors.primary),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(height: 5),
                      ],
                    ),
                  );
                  /*Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.network(homeController
                              .productData!.products![index].thumbnail
                              .toString(),fit: BoxFit.cover,),
                          title: Text(homeController
                                  .productData!.products![index].title
                                  .toString() ??
                              'name'),
                          subtitle: Text(homeController
                              .productData!.products![index].description
                              .toString()),
                        ),
                      ],
                    ),
                  );*/
                },
              )));
  }
}
