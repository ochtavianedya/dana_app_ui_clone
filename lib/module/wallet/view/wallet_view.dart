import 'package:flutter/material.dart';
import 'package:dana_app_ui_clone/core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/wallet_controller.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  Widget build(context, WalletController controller) {
    controller.view = this;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Stack(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle,
                    size: 24.0,
                  ),
                ),
                const Text(
                  "DANA\nPROTECTION",
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(
                  MdiIcons.plusCircle,
                  size: 24.0,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 12.0,
              ),
              child: const Center(
                child: Text(
                  "Wallet",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 24.0,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Looking for something in wallet?",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 300,
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 11),
                        ),
                      ],
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[400]!,
                      ),
                      color: primaryColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.wallet,
                                size: 24.0,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "DANA",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Save your bank cards!",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Transaction just become more less hassle",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28,
                                      child: OutlinedButton.icon(
                                        icon: const Icon(
                                          Icons.add,
                                          size: 18.0,
                                        ),
                                        label: const Text(
                                          "ADD",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: primaryColor,
                                          side: const BorderSide(
                                            color: primaryColor,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onVerticalDragEnd: (e) {
                      if (e.primaryVelocity! < 0) {
                        // slide up
                        controller.updateSlideStatus(false);
                      } else {
                        // slide down
                        controller.updateSlideStatus(true);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.only(
                        top: controller.isSlideDown ? 100 : 0.0,
                      ),
                      child: Transform.translate(
                        offset: const Offset(0, -190),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[500],
                              child: Icon(
                                MdiIcons.chevronDoubleDown,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Transform.scale(
                              scaleX: 1.15,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(64.0),
                                  ),
                                  border: Border.all(
                                    width: 2.0,
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.wallet,
                                          size: 32.0,
                                          color: Colors.grey[400],
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          "WALLET",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
      ),
    );
  }

  @override
  State<WalletView> createState() => WalletController();
}
