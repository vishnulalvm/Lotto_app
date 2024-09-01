import 'package:flutter/material.dart';
import 'package:lotto_app/presentation/widgets/carousel_slider.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> userData = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(251, 255, 249, 249),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(249, 227, 227, 1),
          title: const Text('LOTTO RESULT'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CarouselWithIndicatorDemo(),
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          coustomButton(
                              data: 'Scanner', icon: Icons.qr_code_scanner),
                          coustomButton(
                              data: 'Clime\nLottory',
                              icon: Symbols.trophy),
                          coustomButton(
                              data: 'Lottory', icon: Symbols.flag)                                                                                                                                                                                                                                                                                         ,
                          coustomButton(
                              data: 'News', icon: Symbols.news),
                          coustomButton(
                              data: 'Saved', icon: Symbols.save),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverList.separated(
                itemCount: 10, // Adjust based on your needs
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          height: 5,
                        )),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text('22/4/4233'),
                        ),
                        Expanded(
                            child: Divider(
                          height: 5,
                        )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      height: 382,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                      child: const Column(
                        children: [
                          Text('Akshaya AK 620 Winner List'),
                          Divider(
                            height: 1,
                          ),
                          Text(''),
                          Text('Item'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }

  Widget coustomButton({IconData? icon, required String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(249, 227, 227, 1)),
          child: Icon(icon),
        ),
        Text(data)
      ],
    );
  }
}
