import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'drawer_widget.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uygulama Hakkında'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: KiposDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset(
              "assets/images/ig_logo.png",
            ),
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData)
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Uygulamanın İsmi : " + snapshot.data.appName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Uygulamanın Paketi : " + snapshot.data.packageName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Uygulamanın Derleme Numarası : " +
                            snapshot.data.buildNumber,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Uygulamanın Versiyonu : " + snapshot.data.version,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3311409 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173311044 numaralı Muhammed Emre Küçükkırlı tarafından 25 Haziran 2021 günü yapılmıştır.",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                );

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
