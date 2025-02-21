import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/pages/cart_model.dart';
import 'package:grocery_shop/pages/intro_page.dart';
import 'package:provider/provider.dart';
import 'pages/grocery_item_tile.dart';
import 'pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaf = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
      ),
      key: scaf,
      drawer: Drawer(
        backgroundColor: Colors.green[400],
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: ClipRRect(
                      //This widget to make the image in the circle
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset("images/logo.jpg", fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                    child: ListTile(
                  title: Text(
                    "Abdulmajeed",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "ab.mj770@gmail.com,",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
              ],
            ),
            ListTile(
              title: Text("Home", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.home, color: Colors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text("Account", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.person, color: Colors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text("Order", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.shopping_cart, color: Colors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text("About us", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.info, color: Colors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text("Contact us", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.phone, color: Colors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text("Sign out", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => IntroPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true, //This property to make the title in the center
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        title: const Text("Grocery Shop"),
        backgroundColor: Colors.green[400],
        elevation: 2.7,
        shadowColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              print("Search");
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // Add a welcome message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Good morning, Abdulmajeed",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Let's order fresh items for you",
                  style: GoogleFonts.notoSerif(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),

            // Add divider line
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: Colors.grey,
                thickness: 0.4,
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Fresh Items", style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Consumer<CartModel>(builder: (context, cart, child) {
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: cart.shopItems.length,
                  itemBuilder: (BuildContext context, index) {
                    return GroceryItemTile(
                      itemName: cart.shopItems[index][0],
                      itemPrice: cart.shopItems[index][1],
                      itemImage: cart.shopItems[index][2],
                      color: cart.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItem(index);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
