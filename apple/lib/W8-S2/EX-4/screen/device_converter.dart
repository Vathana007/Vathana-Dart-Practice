import 'package:flutter/material.dart';

enum amountConvert { euro, riels, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final TextEditingController _dollarController = TextEditingController();

  amountConvert _selectConvert = amountConvert.euro;

  String _convertedAmount = "";

  final Map<amountConvert, double> conversionRate = {
    amountConvert.euro: 0.9,
    amountConvert.riels: 4000,
    amountConvert.dong: 24000,
  };

  // Perform conversion
  void _convertAmount() {
    final String input = _dollarController.text;

    if (input.isEmpty) {
      setState(() {
        _convertedAmount = "0";
      });
      return;
    }

    final double dollarAmount = double.tryParse(input) ?? 0;
    final double rate = conversionRate[_selectConvert]!;
    final double result = dollarAmount * rate;

    setState(() {
      _convertedAmount = result.toStringAsFixed(2);
    });
  }

  @override
  void dispose() {
    _dollarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
                controller: _dollarController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollars',
                  hintStyle: const TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (_) => _convertAmount(), // Update conversion on input change
              ),
          const SizedBox(height: 30),
          const Text("Device:"),
          DropdownButton<amountConvert>(
              value: _selectConvert,
              borderRadius: BorderRadius.circular(8),
              items: amountConvert.values
                  .map((amountConvert) => DropdownMenuItem(
                        value: amountConvert,
                        child: Text(amountConvert.name.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectConvert = value!;
                  _convertAmount();
                });
              }),
           const SizedBox(height: 30),
              const Text("Amount in selected device:"),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: textDecoration,
                child: Text(
                  _convertedAmount,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
        ],
      )),
    );
  }
}
