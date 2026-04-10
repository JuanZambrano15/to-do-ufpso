import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_ufpso/screens/home_screen.dart';

void main() {
  testWidgets(
    'HomeScreen crea una tarea local y valida que el titulo no este vacio',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text('¡Bienvenido a To-Do UFPSO!'), findsOneWidget);
      expect(
        find.text('Presiona + para crear tu primera tarea local.'),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('Crear tarea'), findsOneWidget);

      await tester.tap(find.text('Crear'));
      await tester.pump();

      expect(
        find.text('Ingresa un titulo para crear la tarea'),
        findsOneWidget,
      );

      await tester.enterText(
        find.byKey(const Key('task_title_field')),
        'Estudiar arquitectura de software',
      );
      await tester.tap(find.text('Crear'));
      await tester.pumpAndSettle();

      expect(find.text('Tus tareas locales'), findsOneWidget);
      expect(find.text('Estudiar arquitectura de software'), findsOneWidget);
      expect(find.text('Tarea guardada localmente'), findsOneWidget);
    },
  );
}
