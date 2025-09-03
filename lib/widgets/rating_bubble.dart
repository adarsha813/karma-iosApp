import 'package:flutter/material.dart';

class RatingBubble extends StatefulWidget {
  final String questionId;
  final int? initialRating;
  final bool isAdvice;

  final String? initialFeedback;
  final Future<void> Function(String questionId, int rating, String? feedback)
  onRatingSubmitted;

  const RatingBubble({
    super.key,
    required this.questionId,
    required this.initialRating,
    required this.initialFeedback,

    required this.onRatingSubmitted,
    required this.isAdvice,
  });

  @override
  RatingBubbleState createState() => RatingBubbleState();
}

class RatingBubbleState extends State<RatingBubble>
    with TickerProviderStateMixin {
  late int? _selectedRating;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String? _feedback;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isSubmitting = false;
  bool _hasSubmittedFeedback = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this, // no need for widget.vsync
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _selectedRating = widget.initialRating;
    _feedback = widget.initialFeedback;
    _hasSubmittedFeedback =
        widget.initialFeedback != null && widget.initialFeedback!.isNotEmpty;
    if (_feedback != null) {
      _feedbackController.text = _feedback!;
    }
  }

  @override
  void didUpdateWidget(covariant RatingBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialRating != oldWidget.initialRating ||
        widget.initialFeedback != oldWidget.initialFeedback) {
      setState(() {
        _selectedRating = widget.initialRating;
        _feedback = widget.initialFeedback;
        if (_feedback != null) {
          _feedbackController.text = _feedback!;
        }
        _hasSubmittedFeedback = _feedback?.isNotEmpty ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Text(
            widget.isAdvice ? "Rate this advice:" : "Rate this answer:",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),*/
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children:
                [1, 2, 3].map((star) {
                  return GestureDetector(
                    onTap: () => _handleStarTap(star),
                    child: ScaleTransition(
                      scale:
                          _selectedRating == star
                              ? _scaleAnimation
                              : const AlwaysStoppedAnimation(1.0),
                      child: Icon(
                        Icons.star,
                        size: 32,
                        color:
                            _selectedRating != null && star <= _selectedRating!
                                ? Colors.amber
                                : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 8),
          /* Text(
            _selectedRating != null
                ? 'You rated this $_selectedRating star(s)'
                : 'Not rated yet',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),*/
          if (_selectedRating == 1 && !_hasSubmittedFeedback) ...[
            const SizedBox(height: 12),
            const Text(
              "We're sorry you didn't like this answer. Please tell us how we can improve:",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _feedbackController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Your feedback...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => _feedback = value,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: _isSubmitting ? null : _submitFeedback,
              child:
                  _isSubmitting
                      ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                      : const Text('Submit Feedback'),
            ),
          ],
        ],
      ),
    );
  }

  void _handleStarTap(int star) {
    setState(() {
      _selectedRating = star;
      if (star != 1) {
        _feedback = null;
        _feedbackController.clear();
      }
    });

    // 🔥 animate the star
    _controller.forward(from: 0);

    if (star != 1 || _hasSubmittedFeedback) {
      widget.onRatingSubmitted(
        widget.questionId,
        star,
        _hasSubmittedFeedback ? _feedback : null,
      );
    }
  }

  Future<void> _submitFeedback() async {
    if (_feedback?.trim().isEmpty ?? true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your feedback')),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    await widget.onRatingSubmitted(widget.questionId, 1, _feedback);

    if (mounted) {
      setState(() {
        _isSubmitting = false;
        _hasSubmittedFeedback = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _feedbackController.dispose();
    super.dispose();
  }
}
