import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/cubit/warehouse_cubit.dart';
import 'package:test_app/pages/products/product_screen.dart';
import 'package:test_app/pages/units/unit_screen.dart';
import 'package:test_app/pages/warehouses/warehouse_screen.dart';
import 'package:test_app/widgets/item_home_app.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late ProductCubit productCubit;
  late UnitCubit unitCubit;
  late WarehouseCubit warehouseCubit;

  @override
  void initState() {
    productCubit = context.read<ProductCubit>();
    unitCubit = context.read<UnitCubit>();
    warehouseCubit = context.read<WarehouseCubit>();

    productCubit.getProducts();
    unitCubit.getUnit();
    warehouseCubit.getWarehouse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                'Home app',
              ),
              Icon(Icons.menu)
            ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.post_add), Text('Phiếu nhập kho')],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemHomeApp(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductScreen()));
                      },
                      title: 'Sản phẩm'),
                  ItemHomeApp(
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WarehouseScreen()));
                    },
                    title: 'Kho',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemHomeApp(
                    title: 'Đơn vị',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UnitScreen()));
                    },
                  ),
                  ItemHomeApp(
                    title: 'Bộ phận',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemHomeApp(title: 'Thủ kho'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
