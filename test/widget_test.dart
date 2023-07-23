// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dgsden/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('DGS Puan Hesaplayıcı Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(DgsPuanHesaplayici());

    // Find the widgets we need to interact with and enter values.
    final onLisansPuanField = find.byType(TextField).first;
    final sayisalDogruField = find.byType(TextField).at(1);
    final sayisalYanlisField = find.byType(TextField).at(2);
    final sozelDogruField = find.byType(TextField).at(3);
    final sozelYanlisField = find.byType(TextField).at(4);
    final hesaplaButton = find.byType(ElevatedButton);

    // Enter test values for each TextField.
    await tester.enterText(onLisansPuanField, '70');
    await tester.enterText(sayisalDogruField, '30');
    await tester.enterText(sayisalYanlisField, '20');
    await tester.enterText(sozelDogruField, '40');
    await tester.enterText(sozelYanlisField, '10');

    // Tap the hesapla button.
    await tester.tap(hesaplaButton);

    // Wait for the dialog to appear and check the results.
    await tester.pumpAndSettle();
    expect(find.text('DGS Sözel Puanı: 99.85'), findsOneWidget);
    expect(find.text('DGS Sayısal Puanı: 121.90'), findsOneWidget);
    expect(find.text('DGS Eşit Ağırlık Puanı: 156.68'), findsOneWidget);
  });
}
