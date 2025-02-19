import 'package:flutter/material.dart';

class CommonDiseasesScreen extends StatefulWidget {
  const CommonDiseasesScreen({super.key});

  @override
  _CommonDiseasesScreenState createState() => _CommonDiseasesScreenState();
}

class _CommonDiseasesScreenState extends State<CommonDiseasesScreen> {
  final List<bool> _expanded = [false, false, false, false];

  final List<Map<String, String>> _diseases = [
    {
      'name': 'Disease 1',
      'part': 'Leaf',
      'accuracy': '98%',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus tincidunt dolor, sit amet euismod ante ornare dignissim. Nulla at erat, rhoncus sed accumsan sit amet, consequat imperdiet sapien.',
      'imageUrl': 'assets/images/common_disease.jpg'
    },
    {
      'name': 'Disease 2',
      'part': 'Stem',
      'accuracy': '95%',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus tincidunt dolor, sit amet euismod ante ornare dignissim. Nulla at erat, rhoncus sed accumsan sit amet, consequat imperdiet sapien.',
      'imageUrl': 'assets/images/common_disease.jpg'
    },
    {
      'name': 'Disease 3',
      'part': 'Root',
      'accuracy': '90%',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus tincidunt dolor, sit amet euismod ante ornare dignissim. Nulla at erat, rhoncus sed accumsan sit amet, consequat imperdiet sapien.',
      'imageUrl': 'assets/images/common_disease.jpg'
    },
    {
      'name': 'Disease 4',
      'part': 'Flower',
      'accuracy': '85%',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus tincidunt dolor, sit amet euismod ante ornare dignissim. Nulla at erat, rhoncus sed accumsan sit amet, consequat imperdiet sapien.',
      'imageUrl': 'assets/images/common_disease.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5e9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5e9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Common Diseases',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _diseases.length,
          itemBuilder: (context, index) {
            final disease = _diseases[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                color: const Color(0xFFe0edd9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              disease['imageUrl']!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  disease['name']!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Part of Disease: ${disease['part']}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                const SizedBox(height: 5),
                                if (_expanded[index])
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        disease['description']!,
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                if (!_expanded[index])
                                  Text(
                                    '${disease['description']!.substring(0, 50)}...see more',
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _expanded[index]
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _expanded[index] = !_expanded[index];
                              });
                            },
                          ),
                        ],
                      ),
                      if (_expanded[index])
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Detection accuracy rate ${disease['accuracy']}',
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 14),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
