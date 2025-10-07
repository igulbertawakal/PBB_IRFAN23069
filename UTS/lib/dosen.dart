import 'package:flutter/material.dart';

class DosenForm extends StatefulWidget {
  const DosenForm({super.key});

  @override
  State<DosenForm> createState() => _DosenFormState();
}

class _DosenFormState extends State<DosenForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nidnController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _homeBaseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  String _hasilInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Dosen'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nidnController,
                decoration: const InputDecoration(
                  labelText: 'NIDN',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIDN tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _homeBaseController,
                decoration: const InputDecoration(
                  labelText: 'Home Base',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Home Base tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _noTelpController,
                decoration: const InputDecoration(
                  labelText: 'No. Telepon',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No. Telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _hasilInput = '''
Hasil Input:
NIDN: ${_nidnController.text}
Nama: ${_namaController.text}
Home Base: ${_homeBaseController.text}
Email: ${_emailController.text}
No. Telepon: ${_noTelpController.text}
''';
                    });
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              Text(
                _hasilInput,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nidnController.dispose();
    _namaController.dispose();
    _homeBaseController.dispose();
    _emailController.dispose();
    _noTelpController.dispose();
    super.dispose();
  }
}