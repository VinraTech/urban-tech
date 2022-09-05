import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i/Provider/allproduct.dart';
import 'package:i/Shop_online/cart.dart';
import 'package:page_transition/page_transition.dart';

import '../Notifier/allproductnotifier.dart';
import '../mainpage/getallproduct.dart';

class Shoponline extends HookConsumerWidget {
  const Shoponline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(listnotiProvider);
    final ischecklist = useState(false);
    ref.refresh(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 164, 17, 6),
        shadowColor: const Color.fromARGB(255, 201, 16, 3),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRightJoined,
                  child: const Body(),
                  childCurrent: this,
                  duration: const Duration(seconds: 2),
                )
                // ),
                );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          'Shop online',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: Stack(
          children: [
            ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                final e = data[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/dj.avif',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 8.w, bottom: 1.h),
                                child: Text(
                                  e.description,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, bottom: 0.h),
                            child: Text(
                              e.description.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.30,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.w, bottom: 1.h),
                                  child: Text(
                                    'Size:${e.description.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.30,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text("T ${e.price}"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.grey,
                                      ),
                                      // access the provider via ref.read(), then increment its state.
                                      onPressed: () {
                                        ref
                                            .read(listnotiProvider.notifier)
                                            .removetocart(
                                              data.indexOf(e),
                                            );
                                        if (ischecklist.value == true &&
                                            e.count! == 0) {
                                          ischecklist.value = false;
                                        } else {}
                                      },
                                    ),
                                    Text(
                                      e.count.toString(),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                      ),
                                      // access the provider via ref.read(), then increment its state.
                                      onPressed: () {
                                        ref
                                            .read(listnotiProvider.notifier)
                                            .addtocart(
                                              data.indexOf(e),
                                            );
                                        if (ischecklist.value == false) {
                                          ischecklist.value = true;
                                        } else {}
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider()
                  ],
                );
              }),
            ),
            ischecklist.value == true
                ? Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: const Cart_page(),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 182, 82, 62),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('Go to cart'),
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
    // Navigator.push(
    //                       context,
    //                       PageTransition(
    //                         type: PageTransitionType.rightToLeftWithFade,
    //                         child: const Cart_page(),
    //                         duration: const Duration(seconds: 1),
    //                       ),
    //                     );