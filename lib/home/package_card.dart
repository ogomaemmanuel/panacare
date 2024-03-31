import 'package:flutter/material.dart';

class PackageCard extends StatelessWidget {
  Package package;

  PackageCard({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 13.0, left: 9.0, right: 19.0, bottom: 13.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.3),
            child: Row(
              children: [
                Image(
                  image: AssetImage(package.imageUrl),
                  height: 75.7,
                )
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(package.name,style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19.0
            ),),
          ]),
          Wrap(
            children: package.features
                .map((feature) => (ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.check,
                      color:Color.fromRGBO(41, 170, 225, 1)
                      ),
                      title: Text(feature,style: const TextStyle(
                        fontSize: 14.0
                      ),),
                    )))
                .toList(),
          ),
          TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
                minimumSize: const Size(219.0, 43.0),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(41, 170, 225, 1),
              ),
              child: const Text("Choose Package"))
        ]),
      ),
    );
  }
}

class Package {
  String name;
  List<String> features;
  String imageUrl;

  Package(
      {required this.name, required this.features, required this.imageUrl});
}
