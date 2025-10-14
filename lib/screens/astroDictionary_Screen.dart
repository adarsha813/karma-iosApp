import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart';
import 'astro_term_detail_screen.dart';
import '../l10n/app_localizations.dart'; // Add this import

class AstroDictionaryScreen extends StatefulWidget {
  const AstroDictionaryScreen({Key? key}) : super(key: key);

  @override
  State<AstroDictionaryScreen> createState() => _AstroDictionaryScreenState();
}

class _AstroDictionaryScreenState extends State<AstroDictionaryScreen> {
  List<AstroTerm> _terms = [];
  List<AstroTerm> _filteredTerms = [];
  bool _loading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTerms();

    _searchController.addListener(() {
      _filterTerms();
    });
  }

  Future<void> _loadTerms() async {
    try {
      final terms = await ApiService.fetchTerms();
      setState(() {
        _terms = terms;
        _filteredTerms = terms;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  void _filterTerms() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTerms =
          _terms.where((t) {
            final term = t.term.toLowerCase();
            final meaning = (t.meaning).toLowerCase();
            final meaningNepali = (t.meaningNepali ?? '').toLowerCase();
            return term.contains(query) ||
                meaning.contains(query) ||
                meaningNepali.contains(query);
          }).toList();
    });
  }

  Widget _buildSkeletonLoader() {
    final screenHeight = MediaQuery.of(context).size.height;
    final searchBarHeight = 60.0; // approx height including padding
    final rowHeight = 36.0; // same as your ListTile
    final remainingHeight = screenHeight - searchBarHeight - kToolbarHeight;
    final itemCount = (remainingHeight / rowHeight).ceil();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      itemCount: itemCount,
      separatorBuilder: (_, __) => const Divider(height: 0.5),
      itemBuilder: (context, index) {
        if (index == 0) {
          // First row as search bar
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        } else {
          // Term : Meaning rows
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: SizedBox(
                height: rowHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Term placeholder
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Colon placeholder
                    Container(width: 8, height: 18, color: Colors.white),
                    const SizedBox(width: 4),
                    // Meaning placeholder
                    Expanded(
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.astroDictionaryTitle)),
      body:
          _loading
              ? _buildSkeletonLoader()
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: l10n.searchTermsHint,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        _filteredTerms.isEmpty
                            ? Center(child: Text(l10n.noTermsFound))
                            : ListView.separated(
                              itemCount: _filteredTerms.length,
                              separatorBuilder:
                                  (_, __) => const Divider(height: 0.5),
                              itemBuilder: (context, index) {
                                final term = _filteredTerms[index];
                                return ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 0.4, // minimal top/bottom padding
                                  ),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Text(
                                          term.term,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        ": ",
                                      ), // minimal gap between term & meaning
                                      Flexible(
                                        flex: 5,
                                        child: Text(
                                          term.meaning,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => AstroTermDetailScreen(
                                              term: term,
                                            ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                  ),
                ],
              ),
    );
  }
}
