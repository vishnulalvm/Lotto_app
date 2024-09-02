import 'package:flutter/material.dart';
import 'package:lotto_app/presentation/screens/news_screen.dart';
import 'package:lotto_app/presentation/screens/result_screen.dart';
import 'package:lotto_app/presentation/widgets/carousel_slider.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // DateTime? _selectedDate;
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
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Symbols.award_star,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text('LOTTO RESULT'),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
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
                            data: 'Scanner',
                            icon: Icons.qr_code_scanner,
                            onPressed: () {
                              showDateDialog(context).then((value) {
                                barcodeScanner();
                              });
                            },
                          ),
                          coustomButton(data: 'Claime', icon: Symbols.trophy,onPressed: (){

                          }),
                          coustomButton(data: 'Lottery', icon: Symbols.flag),
                          coustomButton(data: 'News', icon: Symbols.news,onPressed: (){
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewsScreen(),
                            ));

                          }),
                          coustomButton(data: 'Saved', icon: Symbols.save),
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text('22/4/4233'),
                        ),
                        Expanded(
                          child: Divider(
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResultScreen(),
                            ));
                      },
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(top: 20),
                          height: 382,
                          width: MediaQuery.of(context).size.width,
                          child: const Column(
                            children: [
                              Text(
                                'Akshaya AK 620 Winner List',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(
                                height: 1,
                              ),
                              Text(''),
                              Text('Item'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }

  Widget coustomButton(
      {IconData? icon, required String data, Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(249, 227, 227, 1)),
            child: Icon(icon),
          ),
          Text(data)
        ],
      ),
    );
  }

  Future barcodeScanner() async {
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(
            isShowFlashIcon: true,
          ),
        ));
    return res;
  }

  Future<void> showDateDialog(BuildContext context) async {
    await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        // DateTime? tempPickedDate;

        return AlertDialog(
          title: const Text('Check the Date'),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    // if (date != null) {
                    //   tempPickedDate = date;
                    // }
                  },
                  child: const Text('Select Date'),
                ),
              ],
            ),
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null); // Return null on cancel
              },
              child: const Text('Cancel'),
            ),
            // Yes Button
            TextButton(
              onPressed: () {
                barcodeScanner();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
