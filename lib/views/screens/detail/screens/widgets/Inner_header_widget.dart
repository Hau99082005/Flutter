import 'package:flutter/material.dart';

class InnerHeaderWidget extends StatelessWidget {
  const InnerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final bannerHeight = screenWidth * 0.32;
    return  SizedBox(
      width: screenWidth,
      height: bannerHeight,
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Image.asset(
              'assets/icons/searchBanner.jpeg',
              width: screenWidth,
              height: bannerHeight,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Row với nút back, search và icon
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nút back
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),

                  const SizedBox(width: 8),

                  // Search box
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Enter text',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/icons/searc1.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Camera icon
                  _iconButton('assets/icons/cam.png'),

                  const SizedBox(width: 8),

                  // Notification icon
                  _iconButton('assets/icons/bell.png'),

                  const SizedBox(width: 8),

                  // Message icon
                  _iconButton('assets/icons/message.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _iconButton(String assetPath) {
  return Material(
    type: MaterialType.transparency,
    child: InkWell(
      onTap: () {
        // TODO: Define action
      },
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}
