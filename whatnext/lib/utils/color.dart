import 'package:flutter/material.dart';

Color randomColor() {
  List<Color> colors = [
    const Color(0xFFE4B875), // Màu vàng đồng
    const Color(0xFFB0BBBC), // Màu xám xanh
    const Color(0xFFBBAACC), // Màu tím nhạt
    const Color(0xFFCB9CA3), // Màu hồng đất
    const Color(0xFF9DCBC9), // Màu xanh ngọc
    const Color(0xFFC1CB9A), // Màu xanh lá mạ
  ];

  colors.shuffle();
  return colors.first;
}
