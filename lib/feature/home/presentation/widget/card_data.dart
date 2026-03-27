import 'dart:ui';

class CardData {
  final String name;
  final String cardType;
  final String cardNumber;
  final String balance;
  final Color cardColor;
  final Color circleColorLeft;
  final Color circleColorRight;

  const CardData({
    required this.name,
    required this.cardType,
    required this.cardNumber,
    required this.balance,
    required this.cardColor,
    required this.circleColorLeft,
    required this.circleColorRight,
  });
}

const List<CardData> cards = [
  CardData(
    name: 'Viren Rangani',
    cardType: 'Amazon Platinium',
    cardNumber: '1254  2546  2552  5552',
    balance: '\$23,423',
    cardColor: Color(0xFF1573FF),
    circleColorLeft: Color(0xFF29B6F6),
    circleColorRight: Color(0xFF1E1671)
  ),
  CardData(
    name: 'Viren Rangani',
    cardType: 'Amazon Platinium',
    cardNumber: '4756  2233  1122  9018',
    balance: '\$12,000',
    cardColor: Color(0xFFFF4267),
    circleColorLeft: Color(0xFF1F88FF),
    circleColorRight: Color(0xFF66BB6A)
  ),
  CardData(
    name: 'Viren Rangani',
    cardType: 'Amazon Platinium',
    cardNumber: '9988  7766  5544  3322',
    balance: '\$5,800',
    cardColor: Color(0xFF5655B9),
    circleColorLeft: Color(0xFFDD0606),
    circleColorRight: Color(0xFFD56725),
  ),
];
