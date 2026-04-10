import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_ufpso/screens/home_screen.dart';

void main() {
  testWidgets(
    'HomeScreen muestra un estado vacio y mantiene visible la opcion de crear tarea',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text('Aun no tienes tareas locales'), findsOneWidget);
      expect(
        find.text(
          'Crea tu primera tarea para empezar a organizar tus actividades.',
        ),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.assignment_outlined), findsOneWidget);
      expect(find.text('Crear mi primera tarea'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    },
  );

  testWidgets(
    'HomeScreen crea una tarea local y valida que el titulo no este vacio',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text('Aun no tienes tareas locales'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
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
