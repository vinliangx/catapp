import 'dart:typed_data';

class Cat {
  final Uint8List payload;
  final DateTime from;

  const Cat(this.payload, this.from);
}
