import 'package:flutter/material.dart';

class MataKuliahForm extends StatefulWidget {
  const MataKuliahForm({super.key});

  @override
  State<MataKuliahForm> createState() => _MataKuliahFormState();
}

class _MataKuliahFormState extends State<MataKuliahForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodeMKController = TextEditingController();
  final TextEditingController _namaMKController = TextEditingController();
  final TextEditingController _sksController = TextEditingController();

  String _hasilInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Mata Kuliah'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeMKController,
                decoration: const InputDecoration(
                  labelText: 'Kode Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode Mata Kuliah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _namaMKController,
                decoration: const InputDecoration(
                  labelText: 'Nama Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Mata Kuliah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _sksController,
                decoration: const InputDecoration(
                  labelText: 'SKS',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'SKS tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'SKS harus berupa angka';
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
Kode MK: ${_kodeMKController.text}
Nama MK: ${_namaMKController.text}
SKS: ${_sksController.text}
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
    _kodeMKController.dispose();
    _namaMKController.dispose();
    _sksController.dispose();
    super.dispose();
  }
}