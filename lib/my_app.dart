import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/text_theme.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        
        useMaterial3: true,
        textTheme: AppTextTheme.textTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrderStatusDropdown(),
        ],
      ),
    );
  }
}



class OrderStatusDropdown extends StatefulWidget {
  const OrderStatusDropdown({super.key});

  @override
  State<OrderStatusDropdown> createState() => _OrderStatusDropdownState();
}

class _OrderStatusDropdownState extends State<OrderStatusDropdown> {
  // Track the currently selected option
  String? _selectedStatus;

  // Options list
  final List<String> _statuses = ['Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // width: 150,
      color: Colors.blue.shade300,
       child: DropdownMenu<String>(
      initialSelection: _selectedStatus,
      label: const Text('Order Status'),
      
      // Enable text-based search filtering within the dropdown menu
      enableSearch: true,
      enableFilter: true,
      requestFocusOnTap: true,
      
      // Handle option selections
      onSelected: (String? newValue) {
        setState(() {
          _selectedStatus = newValue;
        });
      },
      
      // Map options to DropdownMenuEntry configurations
      dropdownMenuEntries: _statuses.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          // Custom styling per item (optional)
          leadingIcon: Icon(_getIconForStatus(value)),
        );
      }).toList(),
    ),
    );
  }

  IconData _getIconForStatus(String status) {
    switch (status) {
      case 'Pending': return Icons.hourglass_empty;
      case 'Processing': return Icons.sync;
      case 'Shipped': return Icons.local_shipping;
      case 'Delivered': return Icons.check_circle;
      default: return Icons.cancel;
    }
  }
}
