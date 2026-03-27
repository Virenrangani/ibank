import 'package:flutter/material.dart';
import 'package:ibank/feature/home/presentation/widget/visa_card.dart';
import 'card_data.dart';


class CardAnimation extends StatefulWidget {
  const CardAnimation({super.key});

  @override
  State<CardAnimation> createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation> with TickerProviderStateMixin{
  int _currentIndex = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextCard() async {
    if (_controller.isAnimating) return;
    await _controller.forward();
    if (!mounted) return;
    setState(() {
      _currentIndex = (_currentIndex + 1) % cards.length;
    });
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    final int second = (_currentIndex + 1) % cards.length;
    final int third = (_currentIndex + 2) % cards.length;

    return GestureDetector(
      onTap: _nextCard,
      onHorizontalDragEnd: (details) {
        if ((details.primaryVelocity ?? 0) < 0) _nextCard();
      },
      child: SizedBox(
        height: 240,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final curve = Curves.easeInOut.transform(_controller.value);

            final slideX  = curve * 400;
            final scale2  = 0.90 + (curve * 0.10);
            final top2    = 14.0 - (curve * 14);
            final scale3  = 0.82 + (curve * 0.08);
            final top3    = 28.0 - (curve * 14);

            return Stack(
              clipBehavior: Clip.none,
              children: [

                Positioned(
                  top: top3,
                  left: 24,
                  right: 24,
                  child: Transform.translate(
                    offset: Offset(0,40),
                    child: Transform.scale(
                      scale: scale3,
                      alignment: Alignment.topCenter,
                      child: VisaCard(data: cards[third]),
                    ),
                  ),
                ),

                Positioned(
                  top: top2,
                  left: 24,
                  right: 24,
                  child: Transform.translate(
                    offset: Offset(0, 22),
                    child: Transform.scale(
                      scale: scale2,
                      alignment: Alignment.topCenter,
                      child: VisaCard(data: cards[second]),
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  left: slideX,
                  right: -slideX,
                  child: VisaCard(data: cards[_currentIndex]),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
