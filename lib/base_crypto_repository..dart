import 'coin_model.dart';

abstract class BaseCryptoRepository{
  Future<List<Coin>> getTopCoin(int page);
  void dispose();
}