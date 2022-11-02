part of '../login_screen.dart';

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  ///The key of the form.
  final _formKey = GlobalKey<FormState>();

  ///The controller of the email text field.
  final TextEditingController _emailController = TextEditingController();

  ///The controller of the password text field.
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          children: [
            ///Title
            Text(
              'Iniciar sesión',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: UIColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ///The email text field.
            GeneralInput(
              label: 'Correo electrónico',
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El correo electrónico es requerido';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            ///The password text field.
            PasswordInput(
              label: 'Contraseña',
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La contraseña es requerida';
                }
                return null;
              },
            ),

            const SizedBox(height: 10),

            ///Forgot password button.
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Forgot password'))),
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ),

            const SizedBox(height: 10),

            ///The login button.
            Consumer(builder: (context, ref, _) {
              ///The state of the login screen.
              final isLoading =
                  ref.watch(loginControllerProvider) is LoginLoadingState;

              return GeneralButton(
                  text: 'Iniciar sesión',
                  isLoading: isLoading,
                  onPressed: () {
                    ///If the form is valid.
                    if (_formKey.currentState?.validate() ?? false) {
                      ///Get the login controller.
                      final loginController =
                          ref.read(loginControllerProvider.notifier);

                      ///Call the login method.
                      loginController.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                    }
                  });
            }),

            const SizedBox(height: 20),

            ///The register button.
            TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Register button pressed'))),
                child: const Text('¿No tienes cuenta? Regístrate'))
          ],
        ),
      ),
    );
  }
}
