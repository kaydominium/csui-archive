import 'package:flutter/material.dart';
import 'package:majulah_shop/models/product_entry.dart';
import 'package:majulah_shop/widgets/left_drawer.dart';
import 'package:majulah_shop/screens/product_detail.dart';
import 'package:majulah_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AllProductListPage extends StatefulWidget {
  const AllProductListPage({super.key});

  @override
  State<AllProductListPage> createState() => _AllProductListPageState();
}

class _AllProductListPageState extends State<AllProductListPage> {
  Future<List<ProductEntry>> fetchNews(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('http://localhost:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to NewsEntry objects
    List<ProductEntry> allProductList = [];
    for (var d in data) {
      if (d != null) {
        allProductList.add(ProductEntry.fromJson(d));
      }
    }
    return allProductList;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Explore Products'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchNews(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Products to Display',
                      style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              // --- MODIFIED: Swapped GridView for ListView ---
              return ListView.builder(
                // --- MODIFIED: Padding for a list view ---
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 12.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  // --- NEW: Added padding between each card ---
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ProductEntryCard(
                      product: snapshot.data![index],
                      onTap: () {
                        // Navigate to product detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
