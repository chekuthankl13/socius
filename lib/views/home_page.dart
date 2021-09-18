import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg/bg.png'), fit: BoxFit.fill),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_sharp)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.location_on)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.rv_hookup)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white60, width: 2),
                color: Colors.black38,
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Log a Fishing Spot',
                    style: TextStyle(color: Colors.white60),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white60, width: 2),
                color: Colors.black38,
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View My Spot',
                    style: TextStyle(color: Colors.white60),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white60, width: 2),
                color: Colors.black38,
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View My Cathes',
                    style: TextStyle(color: Colors.white60),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white60, width: 2),
                color: Colors.black38,
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'My Gear',
                    style: TextStyle(color: Colors.white60),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
