import 'package:demo/pages/login.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  final _tabs = const [
    Text("推荐"),
    Text("你的"),
    Text("别抄"),
    Text("我的"),
  ];

  @override
  Widget build(BuildContext context) {
    // 商品列表
    final products = [
      _Product(
        title: "麦娅月沙发 实木沙发客厅家具 组合套装冬夏两用 小户型经济型木质沙发 配套长茶几【或茶水位】 普通海绵坐垫",
        price: 1300.00,
        image:
            "https://img20.360buyimg.com/jdcms/s460x460_jfs/t1/132279/10/49135/233043/670a2ff6Fb833922e/e186a4a63a1434ad.jpg.webp",
      ),
      _Product(
        title: "【已售百万+】商务腕表石英运动手表休闲皮带男士手表 黑色",
        price: 7.90,
        image:
            "https://img13.360buyimg.com/jdcms/s460x460_jfs/t1/244923/20/20140/134761/67097ba7Ffff2592e/1a61cccf69a4ffc2.jpg.webp",
      ),
      _Product(
        title: "华为HUAWEI  Pura 70  二手手机 羽砂黑 12G+512G",
        price: 4399.00,
        image:
            "https://img30.360buyimg.com/jdcms/s460x460_jfs/t1/183571/14/44136/252723/662db7a9F09017346/ee50b5e22dd49354.png.webp",
      ),
      _Product(
        title: "美的电水壶热水壶大容量 家用烧水壶304不锈钢 双层防烫无缝内胆电热水壶 快速烧水 1.5L 1566",
        price: 59.00,
        image:
            "https://img11.360buyimg.com/jdcms/s460x460_jfs/t1/180294/13/48977/127421/6705d921F3dc0b133/33b02070a97d85aa.jpg.webp",
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: const Icon(Icons.login_outlined),
      ),
      body: Column(
        children: [
          // 搜索栏
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          // 分类栏
          DefaultTabController(
            length: _tabs.length,
            child: TabBar(
              tabs: _tabs,
            ),
          ),

          // 外层加个 Expanded，不然会因为 GridView 无法确定高度而无法显示
          Expanded(
            // 这是旧的 GridView，里面内容都没有改
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(18),
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              childAspectRatio: 0.6,
              children: List.generate(
                24,
                (index) {
                  final product = products[index % products.length];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 0.4,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 商品图片
                          Expanded(
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 商品标题
                                Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),

                                // 商品价格
                                Text(
                                  "￥${product.price}",
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
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
    );
  }
}

/// 商品
class _Product {
  /// 标题
  final String title;

  /// 价格
  final double price;

  /// 图片 url
  final String image;

  _Product({required this.title, required this.price, required this.image});
}
