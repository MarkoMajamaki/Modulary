///
/// Extension for single item in modular ListView
///
String getModularListSingleItemExtension() {
  return "Module2 single item extension";
}

///
/// Extension for list of items in modular ListView
///
List<String> getModularListMultipleItemExtension() {
  List<String> i = [];
  i.add("Module2 item 1 from multiple items extension");
  i.add("Module2 item 2 from multiple items extension");
  i.add("Module2 item 3 from multiple items extension");
  i.add("Module2 item 4 from multiple items extension");
  i.add("Module2 item 5 from multiple items extension");
  return i;
}

///
/// Extension for async single item in modular ListView
///
Future<String> getModularListSingleItemExtensionAsync() async {
  String item = await Future.delayed(
    Duration(microseconds: 1000),
    () {
      return "Module2 single item async extension";
    },
  );

  return item;
}

///
/// Extension for async list of items in modular ListView
///
Future<List<String>> getModularListMultipleItemExtensionAsync() async {
  List<String> items = await Future.delayed(
    Duration(microseconds: 1000),
    () {
      List<String> i = [];
      i.add("Module2 item 1 from multiple items async extension");
      i.add("Module2 item 2 from multiple items async extension");
      i.add("Module2 item 3 from multiple items async extension");
      i.add("Module2 item 4 from multiple items async extension");
      i.add("Module2 item 5 from multiple items async extension");
      return i;
    },
  );

  return items;
}
