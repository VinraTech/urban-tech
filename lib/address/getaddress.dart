import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i/Notifier/allproductnotifier.dart';
import 'package:i/Provider/getadress_provider.dart';
import 'package:i/Shop_online/cart.dart';
import 'package:i/address/postadress.dart';
import 'package:i/address/updateadress.dart';
import 'package:i/address/user.dart';
import 'package:i/model/adressmodel.dart';
import 'package:i/paypal/paypal.dart';
import 'package:page_transition/page_transition.dart';

class GetAdresswidget extends HookConsumerWidget {
  GetAdresswidget(
      {Key? key,
      required this.id,
      required this.size,
      required this.price,
      required this.count})
      : super(key: key);
  final List<String> count;
  final List<String> id;
  final List<String> size;
  final List<String> price;

  var AdressId = "";
  List<String> quantityCount = [];
  List<String> listOfProductId = [];
  List<String> listOfSize = [];
  List<String> listOfPrice = [];

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userssDataProvider);
    final datas = ref.watch(listnotiProvider);
    final totalprice = useState<double>(0);
    final adress = useState<Address?>(null);
    final adressid = useState<List<String>>([]);
    final listofid = useState<List<String>>([]);
    final listofsize = useState<List<String>>([]);
    final singlePrice = useState<List<String>>([]);
    final quantity = useState<List<String>>([]);
    useEffect(() {
      List<double> allprice = [];
      List<String> idd = [];
      List<String> sizee = [];
      List<String> singleprice = [];

      ref.refresh(userssDataProvider);
      // allprice.forEach((element) {});
      for (var i = 0; i < datas.length; i++) {
        if (datas[i].count! > 0) {
          idd.add(datas[i].id.toString());
          singleprice.add(datas[i].price.toString());
          quantityCount.add(datas[i].count.toString());
          listOfProductId.add(datas[i].id.toString());

          listOfPrice.add(datas[i].price.toString());

          allprice.add(datas[i].totalitemprice!);
        }
      }
      Future.microtask(() {
        listofsize.value = listOfSize;
        listofid.value = listOfProductId;
        singlePrice.value = listOfPrice;
        quantity.value = quantityCount;
        totalprice.value =
            totalprice.value + (allprice.reduce((a, b) => a + b));
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 21, 11),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.leftToRightJoined,
                child: const Cart_page(),
                childCurrent: this,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          'Billing Address Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(
            const Duration(seconds: 3),
          );
        },
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.w),
                  child: const Text(
                    'Billing Address Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: const Text(
                    'Select an Address by Clicking/Taping on Address',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 50.w,
                  height: 35.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const Adresswidget(),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Text(
                      '+  Add New Address for Billing',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                data.when(
                  data: (data) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ...data.map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (adress.value != e) {
                                      adress.value = e;
                                      AdressId = e.id.toString();
                                    }
                                  },
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      color: adress.value != e
                                          ? const Color.fromARGB(
                                              255, 251, 251, 251)
                                          : const Color.fromARGB(
                                              255, 114, 202, 242),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Billing info',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .rightToLeftWithFade,
                                                        child:
                                                            const UpdateAdresswidget(),
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                      ),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    size: 17,
                                                  ))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Full Name',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.firstName.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Pincode',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.pincode.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Area',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.area.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Phone no',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.addressPhone.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'State',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.state.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'city',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.city.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Country',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  e.country.toString(),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Center(
                                            child: Center(
                                              child: Text(
                                                'Tap on Address for pay',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 167, 51, 43)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (err, s) => Text(err.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width * 0.99,
        height: 90.h,
        child: Card(
          child: Column(
            children: [
              Row(
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
                  const Text(
                    ' Amount : - ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w, top: 0.h),
                    child: Text(
                      'T ${totalprice.value}',
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.99,
                height: 39.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 177, 19, 8),
                  ),
                  onPressed: () {
                    if (adress.value != null) {
                      UserSimplePref.setTotalPrice(
                        totalprice.value.toDouble(),
                      );
                      print(
                        totalprice.value.toDouble(),
                      );
                      print(
                        UserSimplePref.getTotalPrice(),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Payment(
                            totalprice.value.toString(),
                            listOfProductId.join(', '),
                            listOfSize.join(', '),
                            AdressId,
                            listOfPrice.join(', '),
                            quantityCount.join(', '),
                            'Pay for Order',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Pay'),
                ),
              )
              // SizedBox(
              //   height: 40.h,
              //   width: 150.w,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => Payment(),
              //           ),
              //         );
              //       },
              //       child: const Text('data'),
              //     ),
              //   )
            ],
          ),
        ),
      ),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});
