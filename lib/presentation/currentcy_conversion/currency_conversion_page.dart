import 'package:auto_route/auto_route.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';
import '../../application/currency_converter/currency_converter_state_provider.dart';
import '../core/values/text_styles.dart';

@RoutePage()
class CurrencyConversionPage extends HookConsumerWidget {
  const CurrencyConversionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: sanFranciscoBold.copyWith(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        centerTitle: true,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              'Enter Amount',
              style: sanFranciscoBold.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        theme: CurrencyPickerThemeData(
                          backgroundColor: const Color(0xFF1F1F1F),
                          bottomSheetHeight:
                              MediaQuery.of(context).size.height * 0.8,
                          titleTextStyle: sanFranciscoBold.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          subtitleTextStyle: sanFranciscoBold.copyWith(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          inputDecoration: const InputDecoration(
                            hintText: 'Select Currency',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                            counterStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        onSelect: (Currency currency) {
                          ref
                              .read(currencyConverterStateProvider.notifier)
                              .setSourceCurrency(currency);
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            ref
                                    .watch(currencyConverterStateProvider)
                                    .sourceCurrency
                                    .flag ??
                                '',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ref
                                .watch(currencyConverterStateProvider.select(
                                    (state) => state.sourceCurrency.code))
                                .toUpperCase(),
                            style: sanFranciscoBold.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: sanFranciscoBold.copyWith(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        hintStyle: sanFranciscoBold.copyWith(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade800,
                            width: 1.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent.shade700,
                            width: 2.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF262626),
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
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Convert To',
              style: sanFranciscoBold.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                showCurrencyPicker(
                  context: context,
                  theme: CurrencyPickerThemeData(
                    backgroundColor: const Color(0xFF1F1F1F),
                    bottomSheetHeight: MediaQuery.of(context).size.height * 0.8,
                    titleTextStyle: sanFranciscoBold.copyWith(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    subtitleTextStyle: sanFranciscoBold.copyWith(
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
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  onSelect: (Currency currency) {
                    ref
                        .read(currencyConverterStateProvider.notifier)
                        .addTargetCurrency(currency);
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2B2B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.currency_exchange,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Select Currency',
                      style: sanFranciscoBold.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...ref.watch(currencyConverterStateProvider).targetCurrencies.map(
                  (currency) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F1F1F),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2B2B2B),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      currency.flag?.substring(0, 2) ?? '',
                                      height: 25,
                                      width: 35,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      currency.code,
                                      style: sanFranciscoBold.copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Builder(
                                builder: (context) {
                                  final state =
                                      ref.watch(currencyConverterStateProvider);
                                  if (state.amount <= 0 ||
                                      state.ratesPerUnit == null) {
                                    return const SizedBox.shrink();
                                  }

                                  final rate =
                                      state.ratesPerUnit.rates[currency.code];
                                  if (rate == null) {
                                    return Text(
                                      'Rate not available',
                                      style: sanFranciscoBold.copyWith(
                                        fontSize: 14,
                                        color: Colors.redAccent.shade200,
                                      ),
                                    );
                                  }

                                  final convertedAmount = state.amount * rate;
                                  return Text(
                                    '${convertedAmount.toStringAsFixed(2)} ${currency.symbol}',
                                    style: sanFranciscoBold.copyWith(
                                      fontSize: 14,
                                      color: Colors.greenAccent,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.redAccent,
                              size: 22,
                            ),
                            onPressed: () {
                              ref
                                  .read(currencyConverterStateProvider.notifier)
                                  .removeTargetCurrency(currency);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
