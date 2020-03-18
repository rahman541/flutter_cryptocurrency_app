import 'package:flutter/material.dart';

import 'coin_model.dart';
import 'crpto_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cryptoRepository = CryptoRepository();
  int _pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Coins'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey[900],
            ]
          )
        ),
        child: FutureBuilder(
          future: _cryptoRepository.getTopCoins(page: _pageNum),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)));
            }
            final List<Coin> coins = snapshot.data;
            return RefreshIndicator(
              color: Theme.of(context).accentColor,
              onRefresh: () async {
                setState( () => _pageNum = 0);
              },
                child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (BuildContext context, int index) {
                  final coin = coins[index];
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${++index}',
                          style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w100)
                        ),
                      ],
                    ),
                    title: Text(coin.fullName, style: TextStyle(color: Colors.white)),
                    subtitle: Text(coin.name, style: TextStyle(color: Colors.white70),),
                      trailing: Text('RM ${coin.price.toStringAsFixed(4)}', style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                      )
                    ),
                  );
                }
              ),
            );
          },
        ),
      ),
    );
  }
}