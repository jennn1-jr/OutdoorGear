import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'data/camping_data.dart'; 
import 'models/camping_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    String email = args?["email"] ?? "User";
    String password = args?['password'] ?? '';
    if (email.isEmpty) {
      email = "User";
    }
    
    String username = email.contains('@') ? email.split('@')[0] : email;

    return Scaffold(
      backgroundColor: Colors.grey[100], 
      body: CustomScrollView(
        slivers: [
         
          SliverAppBar(
            backgroundColor: Colors.transparent, 
            foregroundColor:
                Colors.white, 
            expandedHeight: 350.0, 
            pinned: true,
            elevation: 0, 
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                
                children: [
                  
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/background2.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black
                                .withOpacity(0.5), 
                            Colors.black.withOpacity(0.2),
                            Colors.black
                                .withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  Positioned(
                    left: 16,
                    bottom:
                        16, 
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Products",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(blurRadius: 5, color: Colors.black54)
                              ]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Selamat Datang, $username 👋",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              shadows: [
                                Shadow(blurRadius: 5, color: Colors.black54)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             
            ),

            title: const Text(
              "OutdoorGear",
              style: TextStyle(
                  color:
                      Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(blurRadius: 5, color: Colors.black54)
                  ]
                  ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/profile", arguments: {
                      "email": email,
                      "password": password,
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Text(
                      email[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Text(
                "Semua Produk",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

         
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), 
              itemCount: campingList.length,
              itemBuilder: (context, index) {
                return ProductListCard(item: campingList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}


class ProductListCard extends StatelessWidget {
  final CampingItem item;
  const ProductListCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(item: item),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Image.asset(
                  item.gambar,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.brand,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
