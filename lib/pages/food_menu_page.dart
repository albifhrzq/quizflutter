import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../models/food_item.dart';

class FoodMenuPage extends StatelessWidget {
  const FoodMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final List<FoodItem> foodItems = [
      FoodItem(
        name: 'Nasi Goreng',
        price: 'Rp 25.000',
        imageAsset: 'assets/images/NasiGoreng.jpg',
        description:
            'Nasi goreng adalah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng, margarin, atau mentega. '
            'Biasanya ditambah kecap manis, bawang merah, bawang putih, asam jawa, lada dan bumbu-bumbu lainnya.',
      ),
      FoodItem(
        name: 'Mie Goreng',
        price: 'Rp 23.000',
        imageAsset: 'assets/images/MieGoreng.jpg',
        description:
            'Mie goreng adalah hidangan mie yang dimasak dengan digoreng tumis khas Indonesia. '
            'Hidangan ini dibuat dengan bahan utama mie kuning yang digoreng dengan sedikit minyak goreng, dan ditambahkan bumbu.',
      ),
      FoodItem(
        name: 'Sate Ayam',
        price: 'Rp 30.000',
        imageAsset: 'assets/images/SateAyam.jpg',
        description:
            'Sate ayam adalah makanan yang terbuat dari daging ayam yang dipotong kecil-kecil, '
            'ditusuk dengan tusukan sate, dan dibakar dengan api arang. Disajikan dengan bumbu kacang atau kecap manis.',
      ),
      FoodItem(
        name: 'Gado-gado',
        price: 'Rp 20.000',
        imageAsset: 'assets/images/GadoGado.jpg',
        description:
            'Gado-gado adalah makanan khas Indonesia yang berupa sayur-sayuran yang direbus dan dicampur jadi satu, '
            'dengan bumbu kacang atau saus dari kacang tanah yang dihaluskan disertai irisan telur.',
      ),
      FoodItem(
        name: 'Rendang',
        price: 'Rp 35.000',
        imageAsset: 'assets/images/Rendang.jpg',
        description:
            'Rendang adalah masakan daging bercita rasa pedas yang menggunakan campuran dari berbagai bumbu dan rempah-rempah. '
            'Dimasak dalam waktu lama hingga kuahnya kering dan dagingnya empuk.',
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Food App',
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pencarian belum diimplementasikan'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul Daftar Makanan dan Minuman
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              'Daftar Makanan dan Minuman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),

          // Daftar menu makanan
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigasi ke halaman detail makanan
                        Navigator.pushNamed(
                          context,
                          '/food-detail',
                          arguments: foodItems[index],
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar makanan
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              foodItems[index].imageAsset,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Deskripsi makanan dan harga
                          Expanded(
                            child: Stack(
                              children: [
                                // Informasi makanan
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Nama makanan
                                      Text(
                                        foodItems[index].name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      // Deskripsi makanan
                                      Text(
                                        foodItems[index].description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      // Spasi untuk harga
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                // Harga di pojok kanan bawah
                                Positioned(
                                  right: 12,
                                  bottom: 8,
                                  child: Text(
                                    foodItems[index].price,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
