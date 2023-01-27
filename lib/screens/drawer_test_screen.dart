import 'package:flutter/material.dart';

class DrawerTestScreen extends StatefulWidget {
  const DrawerTestScreen({super.key});

  @override
  State<DrawerTestScreen> createState() => _DrawerTestScreenState();
}

class _DrawerTestScreenState extends State<DrawerTestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(20),
              height: 80,
              // color: Colors.yellow,
              child: IconButton(
                icon: Icon(
                  Icons.close_sharp,
                  color: Colors.grey,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            ListTile(
              leading: Text(
                "Pamela Alvedo",
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.grey,
                size: 18,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.production_quantity_limits_rounded,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Product",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.design_services,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Services",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.delivery_dining_rounded,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Orders",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.timelapse_rounded,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Appointments",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.payment_rounded,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Payment",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_outline_sharp,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Favorite",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 25,
              ),
              title: Text(
                "Setting",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey,
              ),
            )
          ],
        )),
      ),
    );
  }
}
  // drawer: Drawer(
        //   backgroundColor: Colors.greenAccent,
        //   child: ListView(
        //     children: [
        //       DrawerHeader(
        //           child: Container(
               
        //         child: Text("Drawer header"),
        //         color: Colors.amber,
        //       )),
        //       UserAccountsDrawerHeader(
        //           accountName: Text("Ahmad"),
        //           accountEmail: Text("ahmadmurtaza1209")),
        //       ListTile(
        //         title: Text("close"),
        //         leading: Icon(Icons.close_sharp),
        //         onTap: () {
        //           Navigator.of(context).pop();
        //         },
        //       )
        //     ],
        //   ),
        // ),
        // body: Center(
        //   child: Text("Drawer Screen"),
        // ),