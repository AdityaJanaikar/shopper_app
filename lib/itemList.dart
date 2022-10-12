import 'package:flutter/material.dart';


class ItemCatalog {
  static List<String> itemNames = [
    'Marie Gold',
    'Bourbon',
    'Oreo',
    'Oreo chocolate',
    'Monaco',
    'Crack Jack',
    'Parle G',
    'Good Day',
    'Tiger',
    '50-50',
    'Jim-jam',
    'Dark Fantasy',
    'Dark Fantasy choco fills',
    'Hide and Seek',
    'Nutri-choice',
  ];


  Item getById(int id) => Item(id, itemNames[id % (itemNames.length)]);

  Item getByPosition(int position){
    return getById(position);
  }
}

class Item {
   final int id;
   final String name;
   final Color color;
   final int price = 10;

  Item(this.id,this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

   @override
   int get hashCode => id;

   @override
   bool operator ==(Object other) => other is Item && other.id == id;

}