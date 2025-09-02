import 'package:flutter/material.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart';
import 'astro_term_detail_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Astro Dictionary")),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search terms...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        _filteredTerms.isEmpty
                            ? const Center(child: Text("No terms found"))
                            : ListView.builder(
                              itemCount: _filteredTerms.length,
                              itemBuilder: (context, index) {
                                final term = _filteredTerms[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      term.term,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ((term.meaning).isNotEmpty)
                                          Text(term.meaning),
                                        if ((term.meaningNepali ?? '')
                                            .isNotEmpty)
                                          Text(
                                            term.meaningNepali ?? '',
                                            style: const TextStyle(
                                              color: Colors.grey,
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
                                  ),
                                );
                              },
                            ),
                  ),
                ],
              ),
    );
  }
}
