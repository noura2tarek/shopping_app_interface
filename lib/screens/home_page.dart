import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_colors.dart';
import 'package:shopping_app_interface/widgets/custom_network_image.dart';
import 'package:shopping_app_interface/widgets/offers_list_view.dart';
import 'package:shopping_app_interface/widgets/products_grid_view.dart';
import '../utils/lists.dart';
import '../widgets/change_lang_button.dart';
import '../widgets/custom_snack_bar.dart';
import '../widgets/custom_text.dart';

/* -------------- Home page ----------------*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Cart items List
  final List<String> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '19'.tr(),
          style: TextStyle(color: AppColors.mainColor),
        ),
        actions: [
          //-- change locale icon button --//
          ChangeLangButton(color: AppColors.mainColor,),
        ],
        backgroundColor: AppColors.black87,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* --- Our products text ---*/
            CustomText(text: '1'.tr()),
            /* --- Page view of products ---*/
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return CustomNetworkImage(
                    height: 150.0,
                    width: 100.0,
                    imageLink: images[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            /* --- Grid view of products ---*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: ProductsGridView(
                  onToggleItemInCartFunction: _onToggleItemInCart),
            ),
            /* --- Hot offers text ---*/
            CustomText(text: '2'.tr()),
            /*-------- Offers List View --------*/
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: SizedBox(
                height: 200.0,
                child: OffersListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //----------- Methods--------------//
  // toggle item in cart function
  void _onToggleItemInCart(String itemName) {
    var isExist = _cartItems.contains(itemName);
    if (isExist) {
      setState(() {
        _cartItems.remove(itemName);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(text: '22'.tr()),
      );
    } else {
      setState(() {
        _cartItems.add(itemName);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(text: '21'.tr()),
      );
    }
  }
}

/* -------------- End of Home page ----------------*/
