# HU-10: Login Real con Firebase Auth

## Objetivo de la Historia

Como usuario, quiero iniciar sesion con mi cuenta real para acceder a mis tareas personales usando Firebase Authentication.

## Comportamiento Implementado

La pantalla `Login` ya no usa un acceso mock para credenciales validas. Ahora intenta autenticar el usuario contra `Firebase Auth` con correo y contrasena.

Si el inicio de sesion es exitoso:

- Firebase valida las credenciales.
- El usuario entra a `Home`.

Si ocurre un error:

- La app muestra un mensaje entendible.

## Requisitos Previos

Para que esta historia funcione realmente debes tener terminada la configuracion de Firebase descrita en:

- `docs/09_registro_real.md`

Eso incluye:

- Proyecto Firebase creado.
- `Authentication > Sign-in method > Email/Password` habilitado.
- Dependencias instaladas con `flutter pub get`.
- Archivo `lib/firebase_options.dart` generado con `flutterfire configure`.

## Paso a Paso para Probar el Login Real

### 1. Verificar que exista un usuario real

Puedes usar:

- Un usuario creado desde la pantalla `Crear Cuenta`.
- Un usuario creado manualmente en Firebase Console.

Para confirmarlo:

1. Ve a Firebase Console.
2. Entra a `Authentication`.
3. Revisa la pestana `Users`.

### 2. Ejecutar la aplicacion

Desde la raiz del proyecto:

```bash
flutter run
```

### 3. Iniciar sesion en la app

1. Abre la pantalla `Iniciar Sesion`.
2. Escribe un correo valido registrado en Firebase.
3. Escribe una contrasena correcta de minimo 6 caracteres.
4. Presiona `Ingresar`.
5. Si todo esta bien, la app te redirige a `Home`.

## Errores Manejados

La implementacion actual ya interpreta estos casos de Firebase:

- Credenciales incorrectas.
- Usuario no encontrado.
- Cuenta deshabilitada.
- Error de red.
- Metodo de autenticacion no habilitado.
- Firebase sin configurar todavia.

## Mensajes Esperados

Algunos mensajes visibles para el usuario son:

- `Las credenciales ingresadas no son correctas.`
- `Esta cuenta fue deshabilitada. Contacta al administrador.`
- `Firebase no esta configurado todavia. Sigue la guia en docs/09_registro_real.md.`

## Archivos Relacionados

- `lib/screens/login_screen.dart`
- `lib/services/auth_service.dart`
- `lib/services/firebase_auth_service.dart`
- `test/screens/login_screen_test.dart`
- `test/screens/access_navigation_test.dart`

## Cobertura de Pruebas

Las pruebas verifican:

1. Validacion local de email y contrasena.
2. Inicio de sesion exitoso con un servicio autenticador inyectado.
3. Mensaje entendible cuando las credenciales son incorrectas.
4. Que la navegacion general entre pantallas siga funcionando.
