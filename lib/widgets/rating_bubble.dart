import 'package:flutter/material.dart';

class RatingBubble extends StatefulWidget {
  final String questionId;
  final int? initialRating;
  final String? initialFeedback;
  final Future<void> Function(String questionId, int rating, String? feedback)
  onRatingSubmitted;

  const RatingBubble({
    super.key,
    required this.questionId,
    required this.initialRating,
    required this.initialFeedback,
    required this.onRatingSubmitted,
  });

  @override
  RatingBubbleState createState() => RatingBubbleState();
}

class RatingBubbleState extends State<RatingBubble> {
  late int? _selectedRating;
  late String? _feedback;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isSubmitting = false;
  bool _hasSubmittedFeedback = false;

  @override
  void initState() {
    super.initState();
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
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rate this answer:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children:
                [1, 2, 3].map((star) {
                  return GestureDetector(
                    onTap: () => _handleStarTap(star),
                    child: Icon(
                      Icons.star,
                      size: 32,
                      color:
                          _selectedRating != null && star <= _selectedRating!
                              ? Colors.amber
                              : Colors.grey,
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedRating != null
                ? 'You rated this $_selectedRating star(s)'
                : 'Not rated yet',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
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
    _feedbackController.dispose();
    super.dispose();
  }
}
