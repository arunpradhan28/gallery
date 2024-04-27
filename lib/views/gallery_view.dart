import 'package:flutter/material.dart';
import 'package:gallery/models/image_models.dart';
import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';


class GalleryView extends StatelessWidget {
  final GalleryController _controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: _controller.searchImages,
              decoration: InputDecoration(
                hintText: 'Search Images',
                prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _controller.calculateCrossAxisCount(context),
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: _controller.images.length,
                  itemBuilder: (context, index) {
                    final image = _controller.images[index];
                    return GestureDetector(
                      onTap: () => _controller.showImageDetails(context, image),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              image.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 8.0,
                            left: 8.0,
                            child: Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.white, size: 16.0),
                                SizedBox(width: 4.0),
                                Text(
                                  '${image.likes}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 8.0,
                            right: 8.0,
                            child: Row(
                              children: [
                                Icon(Icons.remove_red_eye, color: Colors.white, size: 16.0),
                                SizedBox(width: 4.0),
                                Text(
                                  '${image.views}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  
}
