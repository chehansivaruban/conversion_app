import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/presentation/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';

import '../../application/currency_converter/currency_converter_state_provider.dart';

@RoutePage()
class CurrencyConversionPage extends HookConsumerWidget {
  const CurrencyConversionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Currency Converter',
            style: sanFranciscoBold.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Amount Input Section

            Text(
              'Insert amount',
              style: sanFranciscoBold.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 54, 54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Add source currency picker
                  Expanded(
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Enter amount',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          ref
                              .read(currencyConverterStateProvider.notifier)
                              .setAmount(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      showCurrencyPicker(
                        context: context,
                        theme: CurrencyPickerThemeData(
                          backgroundColor: Colors.black,
                          bottomSheetHeight:
                              MediaQuery.of(context).size.height * 0.8,
                          titleTextStyle: sanFranciscoBold.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          subtitleTextStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          inputDecoration: const InputDecoration(
                            hintText: 'Select Currency',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                            // Style for input text
                            counterStyle: TextStyle(color: Colors.white),
                          ),
                          // currencyNameTextStyle:
                          //     const TextStyle(color: Colors.white),
                          // currencyCodeTextStyle:
                          //     const TextStyle(color: Colors.white),
                        ),
                        onSelect: (Currency currency) {
                          ref
                              .read(currencyConverterStateProvider.notifier)
                              .setSourceCurrency(currency);
                        },
                      );
                    },
                    child: Text(
                      ref.watch(currencyConverterStateProvider
                          .select((state) => state.sourceCurrency.code)),
                      style: sanFranciscoBold.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            Text(
              'Convert To',
              style: sanFranciscoBold.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 54, 54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Currency',
                    style: sanFranciscoBold.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showCurrencyPicker(
                        context: context,
                        theme: CurrencyPickerThemeData(
                          backgroundColor: Colors.black,
                          bottomSheetHeight:
                              MediaQuery.of(context).size.height * 0.8,
                          titleTextStyle: sanFranciscoBold.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          subtitleTextStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          currencySignTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          inputDecoration: const InputDecoration(
                            hintText: 'Select Currency',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                            // Style for input text
                            counterStyle: TextStyle(color: Colors.white),
                          ),
                          // currencyNameTextStyle:
                          //     const TextStyle(color: Colors.white),
                          // currencyCodeTextStyle:
                          // const TextStyle(color: Colors.white),
                        ),
                        onSelect: (Currency currency) {
                          ref
                              .read(currencyConverterStateProvider.notifier)
                              .addTargetCurrency(currency);
                        },
                      );
                    },
                    child: Text(
                      'Select',
                      style: sanFranciscoBold.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Display selected target currencies
            const SizedBox(height: 16),
            ...ref
                .watch(currencyConverterStateProvider)
                .targetCurrencies
                .map((currency) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 55, 54, 54),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  currency.flag ?? '',
                                  style: const TextStyle(fontSize: 25),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currency.code,
                                      style: sanFranciscoBold.copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final state = ref.watch(
                                            currencyConverterStateProvider);
                                        if (state.amount <= 0 ||
                                            state.ratesPerUnit == null) {
                                          return const SizedBox.shrink();
                                        }

                                        final rate = state
                                            .ratesPerUnit.rates[currency.code];
                                        if (rate == null) {
                                          return Text(
                                            'Rate not available',
                                            style: sanFranciscoBold.copyWith(
                                              fontSize: 14,
                                              color: Colors.red,
                                            ),
                                          );
                                        }

                                        final convertedAmount =
                                            state.amount * rate;
                                        return Text(
                                          convertedAmount.toStringAsFixed(2),
                                          style: sanFranciscoBold.copyWith(
                                            fontSize: 14,
                                            color: Colors.green,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                ref
                                    .read(
                                        currencyConverterStateProvider.notifier)
                                    .removeTargetCurrency(currency);
                              },
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
