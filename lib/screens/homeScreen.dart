
// import 'dart:developer';

import 'package:emdeon/screens/LoginScreen.dart';
import 'package:emdeon/screens/navbar.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';




class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentIndex = 0;

  // List of screens to display
  final List<Widget> _screens = [
    HomeContent(),
  // SearchScreen(),
    ProfileScreen(),  // Profile screen added to navigation
  ];

  // Function to handle bottom navigation bar item taps
 

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Navbar(),
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 42, 5),
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo2.png',
                      height: constraints.maxWidth > 600 ? 60 : 45, // Responsive logo size
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error, color: Colors.red),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                Flexible(
                  child: CustomButton(
                    title: "Login",
                    bgColor: Colors.green,
                    textColor: Colors.black,
                    width: MediaQuery.of(context).size.width * 0.2,  // 30% of screen width
                    height: MediaQuery.of(context).size.height * 0.06, // 6% of screen height
                    fontSize: screenWidth * 0.04, // 5% of screen width for font size

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),


              ],
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _screens[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search, size: 28),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
         
        ],
      ),
    );
  }
}

// Home Content Widget


class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Headline
            Text(
              "Transforming Ideas into",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.08, // Responsive font size (8% of screen width)
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Digital Excellence",
              style: TextStyle(
                color: const Color.fromARGB(255, 148, 234, 11),
                fontSize: screenWidth * 0.1, // Responsive font size (10% of screen width)
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive vertical spacing
            // Subtext
            Text(
              "Your trusted partner for development of Bespoke Mobile and Web Applications.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: screenWidth * 0.05, // Responsive font size (5% of screen width)
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive vertical spacing
            // Action Buttons
           Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
            children: [
              // Get Quote Button (Styled like Know More)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.3, // Match Know More button width
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 124, 195, 11),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Get Quote",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04, // Match Know More font size
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02), // Responsive spacing

              // Know More Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.3, // Match Get Quote button width
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Color.fromARGB(255, 124, 195, 11), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Know More",
                      style: TextStyle(
                        color: Color.fromARGB(255, 148, 234, 11),
                        fontSize: screenWidth * 0.04, // Match Get Quote font size
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),

            SizedBox(height: 30),
            // Supported Technologies Section
            SupportedTechnologies(),
            SizedBox(height: 30),
            // Featured Section
            FeaturedSection(),
            // About Section
            SizedBox(height: 30,),
            AboutSection(),
            // Why Choose Section
            WhyChooseSection(),
            // Testimonials Section
            TestimonialsSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   backgroundColor: Colors.green.shade900,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            // Profile Picture and Name
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.example.com/your-profile-image.jpg', // Replace with actual image URL or Asset Image
              ),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe', // Replace with dynamic user name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'johndoe@gmail.com', // Replace with dynamic user email
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),

            // Additional Information Section
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'I am a software developer with 5+ years of experience in building mobile and web applications. Passionate about technology and always eager to learn new things.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Add your edit profile functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 16 ,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _items = [
    // 'Apple',
    // 'Banana',
    // 'Cherry',
    // 'Date',
    // 'Grape',
    // 'Lemon',
    // 'Mango',
    // 'Orange',
    // 'Papaya',
    // 'Pineapple',
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  // Function to filter the search results
  void _filterSearchResults(String query) {
    List<String> results = [];
    if (query.isEmpty) {
      results = _items;
    } else {
      results = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Search Screen'),
      //   backgroundColor: Colors.green.shade900,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              onChanged: _filterSearchResults,
              decoration: InputDecoration(
                labelText: 'Search Items',
                hintText: 'Enter search term',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            // Display filtered results
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//supported technologies


class SupportedTechnologies extends StatelessWidget {
  const SupportedTechnologies({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth * 0.15; // Adjust size dynamically
    imageSize = imageSize.clamp(40, 80); // Ensure min (40) and max (80) sizes

    return Column(
      children: [
        // Title Text
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Supported by many companies around the globe",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Scrollable Grid of Logos
        SizedBox(
          height: imageSize + 30, // Adjust height dynamically
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16, // Spacing between images
              alignment: WrapAlignment.center,
              children: [
                Image.asset('assets/nodejs.png', height: imageSize),
                Image.asset('assets/react.png', height: imageSize),
                Image.asset('assets/aws.png', height: imageSize),
                Image.asset('assets/java.png', height: imageSize),
                Image.asset('assets/mongodb.png', height: imageSize),
                Image.asset('assets/django.png', height: imageSize),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//featuers section

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Featured Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 252, 240),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Featured",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Heading Text
          const Text(
            "Our commitment to innovation, quality, and customer satisfaction ensures that every project we undertake is a success.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          // Content Sections
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // First Box
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildFeatureCard(
                        title: "Seamless payments",
                        description:
                            "Enjoy secure, hassle-free transactions with multi-currency support and instant transfers for global convenience.",
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureCard(
                        title: "Agile Development Approach",
                        description:
                            "Ensures faster delivery, better collaboration, and the flexibility to adapt to changing requirements.",
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12), // Spacing between boxes
                // Second Box
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildFeatureCard(
                        title: "Multi-Industry Expertise",
                        description:
                            "From healthcare and education to retail and finance, we bring extensive experience across diverse domains.",
                      ),
                      const SizedBox(height: 14),
                      _buildFeatureCard(
                        title: "Quick Support",
                        description:
                            "From initial consultation to post-deployment maintenance, we provide comprehensive support at every step of your journey.",
                      ),
                    ],
                  ),
                ),
              ],
          ),
          



        ],
      ),
    );
  }

  Widget _buildFeatureCard({required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF8F7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}





//about section




class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Featured Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 252, 240),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "About Emdeon",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Heading Text
          const Text(
            "Emdeon Digital Services Pvt Ltd founded in 2020, is a leading provider of innovative software solutions. We specialize in transforming ideas into scalable, efficient, and user-friendly digital products.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          // Mission, Vision, and Values Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mission Block
              Expanded(
                child: Card(
                  color: const Color(0xFFEFF8F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Our Mission",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5,width: 6,),
                        const Text(
                          "To deliver innovative and reliable software solutions that enhance productivity,drive growth for businesses across diverse industries.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/mission.png', // Replace with your image
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Vision Block
              Expanded(
                child: Card(
                  color: const Color(0xFFEFF8F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Our Vision",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "To be a global leader in digital transformation, recognized for our expertise, creativity, and customer-first approach.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        const SizedBox(height: 16),
                        Image.asset(
                          'assets/vission.png', // Replace with your image
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Values Block
          Card(
            color:  Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Our Values",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Value 1
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: const Text(
                          "Innovation: Harnessing the power of technology to create groundbreaking solutions.",
                          style: TextStyle(color: Colors.white,fontSize: 14, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Value 2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.person, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: const Text(
                          "Customer-Centricity: Putting our client’s success at the heart of everything we do.",
                          style: TextStyle(color: Colors.white,fontSize: 14, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Value 3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.star, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: const Text(
                          "Excellence: Striving for the highest standards in quality and performance.",
                          style: TextStyle(color: Colors.white,fontSize: 14, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Value 4
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.verified, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: const Text(
                          "Integrity: Building trust through transparency and ethical practices.",
                          style: TextStyle(color: Colors.white,fontSize: 14, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Heading
          Row(
            children: [
              const Icon(Icons.bar_chart, color: Colors.green, size: 24),
              const SizedBox(width: 8),
            Center(
              child: Text(
                "Benefits",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),

            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Why Choose Emdeon Digital Services?",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "We’re not just another software development company—we’re your trusted partner in growth and innovation.",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Benefits Cards
          Column(
            children: [
              // First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCard(
                    "Tailored Solutions",
                    "Our solutions are customized to meet your specific goals, ensuring optimal results.",
                    "assets/benefits1.png",
                  ),
                  _buildCard(
                    "Cutting-Edge Technology",
                    "Stay ahead of the curve with the latest tools and technologies.",
                    "assets/benefits2.png",
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCard(
                    "Expert Team",
                    "Our team comprises highly skilled developers, designers, and strategists with years of experience in delivering world-class software solutions.",
                    "assets/benefits3.png",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build a card
  Widget _buildCard(String title, String description, String imagePath) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          const Text(
            "What Our Clients Say",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Testimonials List Scrollable Horizontally
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            child: Row(
              children: [
                _buildTestimonialCard(
                  imageUrl: 'assets/saneesh.jpg',
                  quote:
                      "Working with Emdeon Digital Services has been a game-changer for our business. Their team developed a user-friendly and scalable application that exceeded our expectations. Their professionalism, technical expertise, and timely delivery have made them our go-to software partner.",
                  clientName: "Saneesh A T",
                  clientDesignation: "MD of Hafisoft Technologies",
                ),
                const SizedBox(width: 16),
                _buildTestimonialCard(
                  imageUrl: 'assets/abhilash.jpg',
                  quote:
                      "We approached Emdeon for a complex web application, and they delivered beyond our expectations. The process was seamless, the team was responsive, and the final product has been a cornerstone of our digital transformation.",
                  clientName: "Abhilash Raghu",
                  clientDesignation: "CEO - AMMRAS",
                ),
                const SizedBox(width: 16),
                _buildTestimonialCard(
                  imageUrl: 'assets/michael.jpg',
                  quote:
                      "Amazing experience working with Emdeon. They truly understand customer needs and deliver beyond expectations.",
                  clientName: "Michael Johnson",
                  clientDesignation: "Founder, Startup Hub",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard({
  required String imageUrl,
  required String quote,
  required String clientName,
  required String clientDesignation,
}) {
  return Container(
    width: 300, // Adjust the width as needed
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image and Client Info Row
        Row(
          children: [
            // Client Image
            CircleAvatar(
              radius: 25, // Adjust the size as needed
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 12),
            // Client Name and Designation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clientName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  clientDesignation,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Testimonial Quote
        Text(
          "\"$quote\"",
          style: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}
}




//contactpage

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06, // Responsive font size for the app bar
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Icons in black

        centerTitle: true, // ✅ Centers the title properly
        backgroundColor: Color.fromARGB(255, 6, 94, 25),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600;
            return isWideScreen
                ? Row( // ✅ Desktop: Cards in a row layout
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContactCard(
                        icon: Icons.mail,
                        title: "Mail Here",
                        content: "hr@emdeondigital.com\ninfo@emdeondigital.com",
                        screenWidth: screenWidth, // Pass screenWidth to make text responsive
                      )),
                      SizedBox(width: 20),
                      Expanded(child: _buildContactCard(
                        icon: Icons.location_on,
                        title: "Visit Here",
                        content:
                            "No.IX/159A, 2nd Floor, KEPIP Park Center,\nNear Cyber Crime Police Station, Infopark Campus,\nKochi, Kerala 682042",
                        screenWidth: screenWidth,
                      )),
                      SizedBox(width: 20),
                      Expanded(child: _buildContactCard(
                        icon: Icons.phone,
                        title: "Call Here",
                        content: "+91-9562461503\n+91-8075461503",
                        screenWidth: screenWidth,
                      )),
                    ],
                  )
                : ListView( // ✅ Mobile: Stack cards in a column
                    children: [
                      _buildContactCard(
                        icon: Icons.mail,
                        title: "Mail Here",
                        content: "hr@emdeondigital.com\ninfo@emdeondigital.com",
                        screenWidth: screenWidth,
                      ),
                      _buildContactCard(
                        icon: Icons.location_on,
                        title: "Visit Here",
                        content:
                            "No.IX/159A, 2nd Floor, KEPIP Park Center,\nNear Cyber Crime Police Station, Infopark Campus,\nKochi, Kerala 682042",
                        screenWidth: screenWidth,
                      ),
                      _buildContactCard(
                        icon: Icons.phone,
                        title: "Call Here",
                        content: "+91-9562461503\n+91-8075461503",
                        screenWidth: screenWidth,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String content,
    required double screenWidth, // Added screenWidth parameter
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade100,
            radius: 28, // ✅ Adjust icon size dynamically
            child: Icon(icon, size: 28, color: Colors.green.shade700),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Responsive font size for title (5% of screen width)
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 8),
                Text(content,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size for content (4% of screen width)
                      color: Colors.grey[800],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//about page



class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 94, 25),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Icons in white
        title: Text(
          "About Us",
          style: TextStyle(
            fontSize: screenWidth * 0.05, // Responsive font size
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        // Gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade900, Colors.teal.shade400], // Green gradient
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWideScreen = constraints.maxWidth > 600;
              return isWideScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: AboutUsCard(screenWidth: screenWidth)),
                        SizedBox(width: 20),
                        Expanded(child: OurMissionCard(screenWidth: screenWidth)),
                      ],
                    )
                  : ListView(
                      children: [
                        AboutUsCard(screenWidth: screenWidth),
                        OurMissionCard(screenWidth: screenWidth),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}


// ✅ "About Us" Section with Contact Page's Card Design
// ✅ "About Us" Section with Contact Page's Card Design
class AboutUsCard extends StatelessWidget {
  final double screenWidth;
  const AboutUsCard({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return _buildStyledCard(
      icon: Icons.info,
      title: "About Us",
      content:
          "At Emdeon Digital Services Pvt Ltd, we are dedicated to bridging the gap between innovative technology and real-world business needs.\n\n"
          "Established in 2020, we specialize in delivering customized software services and cutting-edge digital products that empower businesses to excel in today’s competitive landscape.\n\n"
          "Professionals with 20+ years of experience ensure a solid and scalable technology architecture for your applications.\n\n"
          "Our cloud-centric professionals ensure the solution is designed for optimal performance in all demand scenarios.",
    );
  }
}

// ✅ "Our Mission" Section with Contact Page's Card Design
class OurMissionCard extends StatelessWidget {
  final double screenWidth;
  const OurMissionCard({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return _buildStyledCard(
      icon: Icons.rocket_launch,
      title: "Our Mission",
      content: 
        "• 2008 - Started Idea Of A New Entity\n"
        "• 2013 - Launched Our New Product\n"
        "• 2015 - Received Funding\n"
        "• 2016 - Started Tuxfield\n"
        "• 2020 - Started Emdeon Digital Services Pvt Ltd",
    );
  }
}

// ✅ Unified Styled Card Function (Matches Contact Page)
Widget _buildStyledCard({required IconData icon, required String title, required String content}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    ),
    padding: EdgeInsets.all(20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              // Center only the title
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center the title text
              ),
              SizedBox(height: 8),
              // Keep the content left-aligned
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  height: 1.6, // Adjust line height for better readability
                ),
                textAlign: TextAlign.left, // Left-align the content text
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


// ✅ Unified Styled Card Function (Matches Contact Page)
// Widget _buildStyledCard({required IconData icon, required String title, required String content}) {
//   return Container(
//     margin: EdgeInsets.only(bottom: 16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black12,
//           blurRadius: 8,
//           spreadRadius: 2,
//         ),
//       ],
//     ),
//     padding: EdgeInsets.all(20),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
        
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   )),
//               SizedBox(height: 8),
//               Text(content,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[800],
//                   )),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }


//features page


class FeaturesPage extends StatelessWidget {
  final List<Feature> features = [
    Feature("Tailored Solutions", 
      "Every business is unique, and so are our solutions. We deliver custom-built software and products that align perfectly with your specific goals and requirements.",
      Icons.settings, Colors.green),
      
    Feature("Cutting-Edge Technology", 
      "We stay ahead of the curve by leveraging the latest tools, frameworks, and technologies to ensure your software is future-ready and scalable.",
      Icons.mail, Colors.lightGreen),

    Feature("Agile Development", 
      "Our agile approach ensures efficient project management, quicker delivery, and the flexibility to adapt to your changing needs.",
      Icons.grid_view, Colors.purple),

    Feature("Robust Quality Assurance", 
      "We prioritize quality in everything we do. Our rigorous testing processes ensure that every product we deliver is reliable, secure, and performs seamlessly.",
      Icons.verified, Colors.deepPurple),

    Feature("Comprehensive Services", 
      "From ideation to deployment and beyond, we offer end-to-end software services, including development, testing, maintenance, and training.",
      Icons.widgets, Colors.orange),

    Feature("User-Centric Design", 
      "We design with the end-user in mind, creating intuitive, engaging, and aesthetically pleasing interfaces that enhance user experience.",
      Icons.notifications, Colors.redAccent),

    Feature("Cost-Effective Solutions", 
      "Get premium-quality software solutions without exceeding your budget. Our pricing is designed to deliver maximum value for your investment.",
      Icons.notifications, Colors.redAccent),

    Feature("Dedicated Support", 
      "Our commitment doesn’t end with delivery. We provide ongoing support and maintenance to ensure your software continues to perform at its best.",
      Icons.notifications, Colors.redAccent),

    Feature("Proven Track Record", 
      "With years of experience and a portfolio of successful projects, we have earned the trust of businesses across various industries.",
      Icons.notifications, Colors.redAccent),
  ];

  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green.shade900,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Icons in white
      ),
      body: Container(
        // Gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade900, Colors.teal.shade400], // Green gradient
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Our Features",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "At Emdeon Digital Services Pvt Ltd, we take pride in delivering exceptional software services and digital products that set us apart.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 214, 208, 208)),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: features.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 600 ? 2 : 1, // Responsive grid
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return FeatureCard(feature: features[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Feature Data Model
class Feature {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  Feature(this.title, this.description, this.icon, this.color);
}

// Feature Card Widget
class FeatureCard extends StatelessWidget {
  final Feature feature;

  const FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            // ignore: deprecated_member_use
            backgroundColor: feature.color.withOpacity(0.2),
            radius: 28,
            child: Icon(feature.icon, size: 28, color: feature.color),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feature.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(feature.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//service page

class ServicesPage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'title': 'Web Application Development',
      'description': 'We specialize in building dynamic, scalable, and secure web applications that power businesses and enhance user experiences.',
      'image': 'assets/web_dev.png',
    },
    {
      'title': 'E-Commerce Solutions',
      'description': 'Build powerful online stores with seamless navigation, secure payment gateways, and exceptional user experiences to drive conversions.',
      'image': 'assets/E-Commerce Solutions.png',
    },
    {
      'title': 'ERP Development',
      'description': 'We provide cutting-edge ERP and CRM solutions to help businesses streamline operations, enhance customer relationships, and drive growth.',
      'image': 'assets/ERP Development.png',
    },
    {
      'title': 'Front-End and Back-End Development',
      'description': 'From captivating user interfaces to powerful, secure back-end systems, we deliver complete web solutions.',
      'image': 'assets/Front-End and Back-End Development.png',
    },
    {
      'title': 'API Integration',
      'description': 'Integrate third-party services and tools to enhance the functionality of your web application, such as payment gateways, CRMs, etc.',
      'image': 'assets/api_integration.png',
    },
    {
      'title': 'Mobile App Development',
      'description': 'Keep your web application updated, secure, and optimized with our ongoing maintenance and support services.',
      'image': 'assets/Mobile App Development.png',
    },
    {
      'title': 'Web Application Maintenance and Support',
      'description': 'Keep your web application updated, secure, and optimized with our ongoing maintenance and support services.',
      'image': 'assets/Mobile App Development.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        // Gradient Background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade900, Colors.teal.shade400],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent, // Make AppBar blend with gradient
              title: Text(
                'Our Services',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white), // Icons in black

            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                services[index]['image']!,
                                fit: BoxFit.contain,
                                height: 70,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              services[index]['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6.0),
                            Expanded(
                              child: Text(
                                services[index]['description']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}


//feedback screen

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final List<Map<String, String>> feedbacks = [
    {
      'name': 'Abhilash Raghu',
      'role': 'CEO - AMMRAS',
      'image': 'assets/abhilash.jpg',
      'feedback':
          'We approached Emdeon for a complex web application, and they delivered beyond our expectations. The process was seamless, the team was responsive, and the final product has been a cornerstone of our digital transformation.',
    },
    {
      'name': 'Saneesh A T',
      'role': 'MD of Hafisoft Technologies',
      'image': 'assets/saneesh.jpg',
      'feedback':
          'Working with Emdeon Digital Services has been a game-changer for our business. Their team developed a user-friendly and scalable application that exceeded our expectations. Their professionalism, technical expertise, and timely delivery have made them our go-to software partner.',
    },
    {
      'name': 'Renjith Menon',
      'role': 'CEO - Edumasters',
      'image': 'assets/renjith.jpeg',
      'feedback':
          'Amazing experience working with Emdeon. They truly understand customer needs and deliver beyond expectations.',
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          '',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Icons in black

      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade900, Colors.teal.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 45),
              Text(
                'What Users Saying',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Don’t just take our word for it—hear from the businesses we’ve helped transform.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  itemCount: feedbacks.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildFeedbackCard(feedbacks[index]);
                  },
                ),
              ),
              _buildAvatarCarousel(),
              SizedBox(height: 70),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackCard(Map<String, String> feedback) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(feedback['image']!),
            backgroundColor: Colors.grey[200],
          ),
          SizedBox(height: 15),
          Text(
            feedback['name']!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            feedback['role']!,
            style: TextStyle(fontSize: 16, color: Colors.green.shade700),
          ),
          SizedBox(height: 15),
          Text(
            feedback['feedback']!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarCarousel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: feedbacks.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, String> feedback = entry.value;
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: currentIndex == index ? Colors.white : Colors.transparent,
                width: 3,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: currentIndex == index ? 35 : 30,
              backgroundImage: AssetImage(feedback['image']!),
              backgroundColor: Colors.grey[200],
            ),
          ),
        );
      }).toList(),
    );
  }
}

//projects page

class ProjectPage extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {'image': 'assets/flutter.jpg'},
    {'image': 'assets/mern.jpg'},
    {'image': 'assets/react.jpg'},
    {'image': 'assets/python.jpg'},
    {'image': 'assets/next-JS.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          '',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Icons in black

      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade900, Colors.teal.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Projects',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(), // Smooth scrolling
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Bigger images (2 per row)
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1.3, // Larger aspect ratio
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            projects[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

