import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int currentIndex = 0;
  String buildingType = "Villa";
  int selectedBedrooms = 1;
  int selectedBathrooms = 1;
  int selectedArea = 1;
  int selectedLevel = 1;

  // List of locations in Egypt
  List<String> locations = [
    'Cairo',
    'Alexandria',
    'Luxor',
    'Aswan',
    'Hurghada',
    'Sharm El Sheikh',
    // Add more locations as needed
  ];

  // Controllers for text fields
  TextEditingController priceController = TextEditingController();
  String selectedLocation = '';

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'lib/pics/apartment2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                __buildSearchBar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildDropdownField(
                          title: 'Location',
                          items: locations,
                          value: selectedLocation,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLocation = newValue!;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          title: 'Price',
                          controller: priceController,
                          hintText: 'Enter price',
                        ),
                        const SizedBox(height: 20),
                        _buildRadioField(
                          title: 'Levels',
                          groupValue: selectedLevel,
                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value as int;
                            });
                          },
                          count: 5,
                        ),
                        const SizedBox(height: 20),
                        _buildRadioField(
                          title: 'Area',
                          groupValue: selectedArea,
                          onChanged: (value) {
                            setState(() {
                              selectedArea = value as int;
                            });
                          },
                          count: 5,
                        ),
                        const SizedBox(height: 20),
                        _buildRadioField(
                          title: 'Bedrooms',
                          groupValue: selectedBedrooms,
                          onChanged: (value) {
                            setState(() {
                              selectedBedrooms = value as int;
                            });
                          },
                          count: 5,
                          icon: Icons.bed,
                        ),
                        const SizedBox(height: 20),
                        _buildRadioField(
                          title: 'Bathrooms',
                          groupValue: selectedBathrooms,
                          onChanged: (value) {
                            setState(() {
                              selectedBathrooms = value as int;
                            });
                          },
                          count: 5,
                          icon: Icons.bathtub,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle search action here
                              String price = priceController.text;

                              // Do something with location and price
                              print('Location: ${locations[0]}, Price: $price');
                            },
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              shadowColor: Colors.black54,
                              elevation: 10,
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String title,
    required List<String> items,
    required String value,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: value.isNotEmpty ? value : null,
            onChanged: onChanged,
            underline: Container(),
            items: items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String title,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioField({
    required String title,
    required int groupValue,
    required void Function(int?) onChanged,
    required int count,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) Icon(icon),
            if (icon != null) const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            count,
            (index) => Row(
              children: [
                Radio(
                  value: index + 1,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text('${index + 1}'),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget __buildSearchBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            borderRadius: BorderRadius.circular(32.0),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(32.0),
              onTap: () {
                // Handle search action
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 8.0,
                      spreadRadius: 4.0,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          // Handle text input
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
