import 'package:flutter/material.dart';

///
/// Register extensions
///
class Extensions {
  // All extensions factories
  static Map<String, List<_ExtensionItemBase>> _extensions =
      Map<String, List<_ExtensionItemBase>>();

  //
  // Register extension with key
  //
  static void register(
      String key, Function(BuildContext? context) createExtension,
      {int weight = 0}) {
    _registerInternal(key, _ExtensionItem(createExtension, weight));
  }

  //
  // Register collection of extension with key
  //
  static void registerCollction(
      String key, Function(BuildContext? context) createExtension) {
    _registerInternal(key, _ExtensionItemCollection(createExtension));
  }

  ///
  /// Do extension registering internal
  ///
  static void _registerInternal(String key, _ExtensionItemBase ext) {
    // Check is there any object registered with the same key
    if (_extensions.keys.contains(key)) {
      // Add new extension to the list
      _extensions[key]!.add(ext);
    } else {
      // If not, then register extension with key
      List<_ExtensionItemBase> list = [];
      list.add(ext);
      _extensions[key] = list;
    }
  }

  ///
  /// Get only type T extensions which are registered with key and await until
  /// every extension is created async
  ///
  static Future<List<T>> getAsync<T>(String key,
      [BuildContext? context]) async {
    List<_CreatedExtension> extensions = [];

    // Check is there any object registered with same key
    if (_extensions.keys.contains(key)) {
      // List of extension which are going to be created async or created sync
      List<_CreatingExtension> extensionCreating = [];

      // Start every extension creation simultaneously without awaiting
      for (int i = 0; i < _extensions[key]!.length; i++) {
        var extItem = _extensions[key]![i];
        extensionCreating
            .add(_CreatingExtension(extItem.create(context), extItem));
      }

      // Loop all extensions which are going to be created async or already created sync
      for (int i = 0; i < extensionCreating.length; i++) {
        var extItem = extensionCreating[i];

        if (extItem.extensionItem is _ExtensionItemCollection) {
          // Create collection of extension objects
          var extensionCollection;

          // If extension creation should await
          if (extItem.createResult is Future) {
            extensionCollection = await extItem.createResult;
          } else {
            extensionCollection = extItem.createResult;
          }

          // Add all single items from collection to extension list
          for (int i = 0; i < extensionCollection.length; i++) {
            extensions.add(_CreatedExtension(extensionCollection[i], 0));
          }
        } else {
          // Create extension
          var singleExtension;

          // If extension creation should await
          if (extItem.createResult is Future) {
            singleExtension = await extItem.createResult;
          } else {
            singleExtension = extItem.createResult;
          }

          var item = extItem.extensionItem as _ExtensionItem;
          extensions.add(_CreatedExtension(singleExtension, item.weight));
        }
      }
    }

    // Sort extensions by weight. More weight, then closer to 0 index.
    extensions.sort((a, b) => a.weight.compareTo(b.weight));

    // Return only type T extensions
    return _getTypedExtensionsOnly<T>(extensions);
  }

  //
  // Get only type T extensions by key
  //
  static List<T> get<T>(String key, [BuildContext? context]) {
    List<_CreatedExtension> extensions = [];

    // Check is there any object registered with same key
    if (_extensions.keys.contains(key)) {
      for (int i = 0; i < _extensions[key]!.length; i++) {
        var extItem = _extensions[key]![i];

        if (extItem is _ExtensionItemCollection) {
          // Create collection of extension objects
          var extensionCollection = extItem.create(context);

          // Add all single items from collection to extension list
          for (int i = 0; i < extensionCollection.length; i++) {
            extensions.add(_CreatedExtension(extensionCollection[i], 0));
          }
        } else {
          var item = extItem as _ExtensionItem;
          extensions.add(_CreatedExtension(item.create(context), item.weight));
        }
      }
    }

    // Sort extensions by weight. More weight, then closer to 0 index.
    extensions.sort((a, b) => a.weight.compareTo(b.weight));

    // Return only type T extensions
    return _getTypedExtensionsOnly<T>(extensions);
  }

  ///
  /// Get extensions only with type T
  ///
  static List<T> _getTypedExtensionsOnly<T>(
      List<_CreatedExtension> extensions) {
    List<T> retVal = [];
    for (int i = 0; i < extensions.length; i++) {
      var actualExtension = extensions[i].actualExtension;
      if (actualExtension is T) {
        retVal.add(extensions[i].actualExtension as T);
      }
    }
    return retVal;
  }
}

// Internal helper classes

///
/// Base class for registered extensions
///
class _ExtensionItemBase {
  final Function(BuildContext? context) create;
  _ExtensionItemBase(this.create);
}

///
/// Registered single extension
///
class _ExtensionItem extends _ExtensionItemBase {
  final int weight;
  _ExtensionItem(create, this.weight) : super(create);
}

///
/// Registered extension collection
///
class _ExtensionItemCollection extends _ExtensionItemBase {
  _ExtensionItemCollection(create) : super(create);
}

///
/// Actual extension which creation is ready
///
class _CreatedExtension {
  final int weight;
  final Object actualExtension;

  _CreatedExtension(this.actualExtension, this.weight);
}

///
/// Extension which is going to be created
///
class _CreatingExtension {
  // Extension create result. If extension is created async this is Future if
  // extension is created sync then this is actual extension
  final Object createResult;

  // Registered extension item
  final _ExtensionItemBase extensionItem;

  _CreatingExtension(this.createResult, this.extensionItem);
}
