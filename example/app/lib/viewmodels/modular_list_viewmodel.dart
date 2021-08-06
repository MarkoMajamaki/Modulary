import 'package:flutter/widgets.dart';
import 'package:modulary/modulary.dart';
import 'package:shared/extension_keys.dart';

class ModularListViewModel extends ChangeNotifier {
  ///
  /// Get items from all modules
  ///
  List<String> get items {
    return Extensions.getExtensions<String>(modularListKey);
  }

  ///
  /// Get async extended items from all modules
  ///
  Future<List<String>> get itemsAsync async {
    return await Extensions.getExtensionsAsync<String>(modularAsyncListKey);
  }
}
