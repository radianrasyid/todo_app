import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controllers/home_controller.dart';
import 'package:todo_app/themes/theme_color.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.loading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: ThemeColor.mainBg,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  'Home',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ThemeColor.pureWhite,
                  ),
                ),
                actions: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.telegram),
                    ),
                  )
                ],
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_rounded)),
              ),
              body: controller.todoList.isEmpty
                  ? Center(
                      child: Image.asset('assets/img/nullTodo.png'),
                    )
                  : RefreshIndicator(
                      backgroundColor: ThemeColor.mainBg,
                      child: Column(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style:
                                  GoogleFonts.lato(color: ThemeColor.pureWhite),
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: ThemeColor.pureWhite,
                                  ),
                                  fillColor: ThemeColor.bgFormField,
                                  border: const OutlineInputBorder(),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ThemeColor.pureWhite),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  isDense: true,
                                  hintText: 'Search',
                                  hintStyle: GoogleFonts.lato(
                                      color: ThemeColor.pureWhite,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'To-Do',
                                  style: GoogleFonts.lato(
                                      color: ThemeColor.pureWhite),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.selectAllTodo();
                                  },
                                  child: Text(
                                    'Select All',
                                    style: GoogleFonts.lato(
                                        color: ThemeColor.pureWhite),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 10,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.todoList.length,
                                itemBuilder: (context, index) {
                                  final item = controller.todoList[index];
                                  final bool isComplete =
                                      controller.todoList[index].completed;
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 25),
                                          decoration: BoxDecoration(
                                              color: ThemeColor.secondary,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                  shape: CircleBorder(),
                                                  value: isComplete,
                                                  onChanged: (value) {
                                                    controller
                                                        .changeCompelet(index);
                                                  }),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 250,
                                                    child: Text(
                                                      item.title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(
                                                          color: ThemeColor
                                                              .pureWhite,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Today at 16.45',
                                                        style: GoogleFonts.lato(
                                                            color: ThemeColor
                                                                .pureWhite),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ElevatedButton.icon(
                                                              onPressed: () {},
                                                              icon: const Icon(
                                                                Icons.school,
                                                                color: ThemeColor
                                                                    .pureWhite,
                                                              ),
                                                              label: const Text(
                                                                'University',
                                                              )),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          ElevatedButton.icon(
                                                              onPressed: () {},
                                                              icon: const Icon(
                                                                Icons.flag,
                                                                color: ThemeColor
                                                                    .pureWhite,
                                                              ),
                                                              label: const Text(
                                                                  '1'))
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                      onRefresh: () {
                        return controller.getAllTodos();
                      }),
              floatingActionButton: FloatingActionButton(
                backgroundColor: ThemeColor.mainBgButton,
                onPressed: () {
                  showModalBottomSheet<void>(
                    enableDrag: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: ThemeColor.pureWhite,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                color: ThemeColor.secondary,
                elevation: 0,
                notchMargin: 10,
                shape: const CircularNotchedRectangle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.home,
                          color: ThemeColor.pureWhite,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month,
                          color: ThemeColor.pureWhite,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: ThemeColor.pureWhite,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: ThemeColor.pureWhite,
                        )),
                  ],
                ),
              ),
            );
    });
  }
}
