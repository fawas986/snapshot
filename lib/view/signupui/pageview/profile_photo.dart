import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:snapshot/view/Homeui/homeview.dart';

class OnboardingPages extends StatefulWidget {
  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _pageController = PageController();
  File? _profileImage;
  int _currentPage = 0;

  String? selectedAgeGroup; // Tracks selected age group
  Set<String> selectedInterests = {}; // Tracks selected interests

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  void _toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildAddProfilePage(),
                _buildSelectAgeGroupPage(),
                _buildAddInterestsPage(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
              activeDotColor: Color(0xFF431F82),
              dotColor: Colors.grey.shade300,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF431F82),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Homeview(),
                        ),
                            (Route<dynamic> route) => false,

                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF431F82),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAddProfilePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Add Profile Photo",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xFF431F82),
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 100),
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 130,
            backgroundColor: Colors.grey.shade300,
            backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
            child: _profileImage == null
                ? Icon(Icons.person, size: 100, color: Colors.grey.shade700)
                : null,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Name",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xFF431F82),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectAgeGroupPage() {
    List<String> ageGroups = [
      "below 13",
      "13-19",
      "20-35",
      "35-60",
      "Above 60"
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select your age group",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xFF431F82),
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: ageGroups.map((ageGroup) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAgeGroup = ageGroup;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  decoration: BoxDecoration(
                    color: selectedAgeGroup == ageGroup
                        ? Color(0xFF431F82)
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ageGroup,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: selectedAgeGroup == ageGroup
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAddInterestsPage() {
    List<String> interests = [
      "Nature",
      "Fashion",
      "Photojournalism",
      "Event",
      "Portrait",
      "Fine art",
      "Travel",
      "Architecture",
      "Advertising",
      "Pet Photography",
      "Sports",
      "Wedding",
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Finally add your Interests",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xFF431F82),
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 50),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: interests.map((interest) {
            return GestureDetector(
              onTap: () => _toggleInterest(interest),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: selectedInterests.contains(interest)
                      ? Color(0xFF431F82)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  interest,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: selectedInterests.contains(interest)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
