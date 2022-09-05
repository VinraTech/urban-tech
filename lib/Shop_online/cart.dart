import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:i/Shop_online/Shoponline.dart';
import 'package:page_transition/page_transition.dart';

import '../Notifier/allproductnotifier.dart';
import '../address/getaddress.dart';

class Cart_page extends HookConsumerWidget {
  const Cart_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(listnotiProvider);
    final totalprice = useState<double>(0);
    final ischecklist = useState(false);
    final ischeckout = useState(false);
    final listofid = useState<List<String>>([]);
    final listofsize = useState<List<String>>([]);
    final singlePrice = useState<List<String>>([]);
    final quantity = useState<List<String>>([]);

    useEffect(() {
      List<double> allprice = [];
      // allprice.forEach((element) {});
      for (var i = 0; i < data.length; i++) {
        if (data[i].count! > 0) {
          allprice.add(data[i].totalitemprice!);
        }
      }
      Future.microtask(() {
        totalprice.value =
            totalprice.value + (allprice.reduce((a, b) => a + b));
      });

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 18, 8),
        title: const Text('My Cart'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: const Shoponline(),
                  duration: const Duration(seconds: 2),
                  childCurrent: this),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Card(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                final e = data[index];
                Future.microtask(
                  () => ischeckout.value = !(e.count! > 0),
                );
                if (e.count! > 0) {
                  return Column(
                    children: [
                      Card(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 2.0),
                                        child: Image.asset(
                                          'assets/dj.avif',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30.h,
                                              child: Text(
                                                "${e.name}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "T ${e.price}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle,
                                          color: Colors.grey,
                                        ),
                                        // access the provider via ref.read(), then increment its state.
                                        onPressed: () {
                                          totalprice.value = totalprice.value -
                                              double.parse(e.price);
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
                                          totalprice.value = totalprice.value +
                                              double.parse(e.price);
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
            Positioned(
              bottom: 0,
              child: Card(
                elevation: 100,
                child: Container(
                  height: 150,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, top: 10.h),
                            child: const Text(
                              'Subtotal \nincludes taxes and : \nGST',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, right: 10.w),
                            child: const Text(
                              'Pay Amount:',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 20.h, right: 20.w),
                            child: Text(
                              "T ${totalprice.value}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: totalprice.value != 0.0
                                      ? Colors.red
                                      : Colors.grey),
                              onPressed: () async {
                                if (totalprice.value != 0.0) {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: GetAdresswidget(
                                        id: listofid.value,
                                        size: listofsize.value,
                                        price: singlePrice.value,
                                        count: quantity.value,
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }

                                print(data);
                              },
                              child: const Text('Checkout'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
