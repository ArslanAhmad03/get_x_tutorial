import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/Controllers/counter_controller.dart';
import 'package:get_x_tutorial/Controllers/favourite_controller.dart';
import 'package:get_x_tutorial/Controllers/image_picker_controller.dart';
import 'package:get_x_tutorial/Controllers/login_controller.dart';
import 'package:get_x_tutorial/Controllers/switch_countroller.dart';
import 'package:get_x_tutorial/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = Get.put(HomeController());
  final CountController countController = Get.put(CountController());
  final SwitchController switchController = Get.put(SwitchController());
  final FavouriteController favouriteController =
      Get.put(FavouriteController());
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("_controller.currentTheme.value ${_controller.currentTheme.value}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(_controller.currentTheme.value == ThemeMode.dark
            ? 'GetX Dark Mode'
            : 'GetX Light Mode')),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Obx(
                      () => Text('getx dialog box ${countController.x.value}')),
                  subtitle: const Text('Text(getx dialog box,'),
                  onTap: () {
                    Get.defaultDialog(
                      title: "title",
                      middleText: 'middle text just 3 lines',
                      titlePadding: const EdgeInsets.only(top: 20.0),
                      contentPadding: const EdgeInsets.all(20.0),
                      content: const Text(
                          '''[GETX] Instance "GetMaterialController" has been initialized'''),
                      confirm: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('confirm')),
                      cancel: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('cancel')),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('message'.tr),
                  subtitle: Text('name'.tr),
                  onTap: () {
                    Get.defaultDialog(
                      title: "title",
                      middleText: 'middle text just 3 lines',
                      titlePadding: const EdgeInsets.only(top: 20.0),
                      contentPadding: const EdgeInsets.all(20.0),
                      content: const Text(
                          '''[GETX] Instance "GetMaterialController" has been initialized'''),
                      confirm: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('confirm')),
                      cancel: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('cancel')),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('light theme'),
                  onTap: () {
                    Get.bottomSheet(Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.dark_mode),
                            title: const Text('Dark Theme'),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                              if (kDebugMode) {
                                print('Dark');
                              }
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.light_mode),
                            title: const Text('light Theme'),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                              if (kDebugMode) {
                                print('light');
                              }
                            },
                          )
                        ],
                      ),
                    ));
                  },
                ),
              ),
              Container(
                height: Get.height * 0.1 + 16,
                color: Colors.grey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              Get.updateLocale(const Locale('en', 'US'));
                            },
                            child: const Text('English')),
                        OutlinedButton(
                            onPressed: () {
                              Get.updateLocale(const Locale('ur', 'PK'));
                            },
                            child: const Text('Urdu')),
                        const Spacer(),
                        const Text('notify'),
                        Obx(() {
                          return Switch(
                              value: switchController.notification.value,
                              onChanged: (onChanged) {
                                switchController.switchButton(onChanged);
                              });
                        })
                      ],
                    ),
                    Obx(
                      () => Switch(
                        value: _controller.currentTheme.value == ThemeMode.dark,
                        onChanged: (value) {
                          _controller.switchTheme();
                          //Get.changeThemeMode(_controller.currentTheme.value);
                          if (kDebugMode) {
                            print(
                              "_controller.currentTheme.value ${_controller.currentTheme.value}");
                          }
                        },
                        activeColor: CustomTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Container(
                  height: 100,
                  width: Get.width,
                  color: Colors.red.withOpacity(countController.opacity.value),
                ),
              ),
              Obx(
                () => Slider(
                  value: countController.opacity.value,
                  onChanged: (value) {
                    countController.opacity.value = value;
                  },
                ),
              ),
              Card(
                color: Colors.grey.withAlpha(130),
                shadowColor: Colors.black54,
                surfaceTintColor: Colors.blue,
                elevation: 8.0,
                child: SizedBox(
                  height: Get.height * 0.5,
                  child: ListView.builder(
                      itemCount: favouriteController.fruitList.length,
                      itemBuilder: (BuildContext, index) {
                        return ListTile(
                          onTap: () {
                            if (kDebugMode) {
                              print(index);
                            }
                          },
                          leading: GestureDetector(
                            onTap: () {
                              imagePickerController.imagePicker();
                            },
                            child: CircleAvatar(
                              backgroundImage: imagePickerController
                                      .imagePath.isNotEmpty
                                  ? FileImage(File(
                                      imagePickerController.imagePath.value))
                                  : null,
                            ),
                          ),
                          title: Text(favouriteController.fruitList[index]),
                          subtitle: Text("$index"),
                          trailing: Obx(
                            () => GestureDetector(
                              onTap: () {
                                if (favouriteController.tempFruitList.contains(
                                    favouriteController.fruitList[index])) {
                                  favouriteController.removeFromFavourite(
                                      favouriteController.fruitList[index]);
                                } else {
                                  favouriteController.addToFavourite(
                                      favouriteController.fruitList[index]);
                                }
                                setState(() {});
                                if (kDebugMode) {
                                  print(favouriteController.tempFruitList);
                                }
                              },
                              child: Icon(
                                Icons.favorite,
                                color: favouriteController.tempFruitList
                                        .contains(favouriteController
                                            .fruitList[index])
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              TextFormField(
                controller: loginController.emailController.value,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: loginController.passwordController.value,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                ),
              ),
              const SizedBox(height: 8.0),
              Obx(() {
                return InkWell(
                  onTap: () {
                    loginController.loginApi();
                  },
                  child: loginController.loading.value
                      ? const CircularProgressIndicator()
                      : Container(
                          height: 30,
                          width: Get.width,
                          color: Colors.grey,
                          child: const Center(
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                              ),
                          ),
                        ),
                );
              }),
              SizedBox(
                height: Get.height * 0.2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('title', 'message', backgroundColor: Colors.red);
          countController.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
