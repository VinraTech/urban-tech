import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Notifier/galleries.dart';
import '../Provider/Gallery.dart';

class Getimages extends HookConsumerWidget {
  const Getimages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userssDataProvider);
    final datas = ref.watch(GalleiresnotiProvider);

    useEffect(() {
      ref.refresh(userssDataProvider);
      return null;
    }, []);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 164, 17, 6),
          shadowColor: const Color.fromARGB(255, 201, 16, 3),
          automaticallyImplyLeading: true,
          title: const Text(
            'Gallaries',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future<void>.delayed(const Duration(seconds: 3));
          },
          child: Stack(
            children: [
              ListView(
                children: [
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
                                      // if (adress.value != e) {
                                      //   adress.value = e;
                                      // }
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.821,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Card(
                                        // color: adress.value != e
                                        //     ? const Color.fromARGB(
                                        //         255, 251, 251, 251)
                                        //     : const Color.fromARGB(
                                        //         255, 114, 202, 242),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 70.h,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                child: Image.asset(
                                                  'assets/dj.avif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
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
//       ),
        ));
  }
}
