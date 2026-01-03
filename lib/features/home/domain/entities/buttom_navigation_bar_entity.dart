import 'package:fruits_apps/core/utils/app_images.dart';

class ButtomNavigationBarEntity {
  final String activeItem, inActiveItem;
  final String name;

  ButtomNavigationBarEntity({
    required this.activeItem,
    required this.inActiveItem,
    required this.name,
  });
}

List<ButtomNavigationBarEntity> get buttomNavigationBarItem => [
  ButtomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldHome,
    inActiveItem: Assets.imagesVuesaxOutlineHome,
    name: 'الرئيسية',
  ),
  ButtomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldProducts,
    inActiveItem: Assets.imagesVuesaxOutlineProducts,
    name: 'المنتجات',
  ),
  ButtomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldShoppingCart,
    inActiveItem: Assets.imagesVuesaxOutlineShoppingCart,
    name: 'سله التسوق',
  ),
  ButtomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldUser,
    inActiveItem: Assets.imagesVuesaxOutlineUser,
    name: 'الحساب',
  ),
];
