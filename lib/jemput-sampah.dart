import 'package:dpbo/models/JemputSampahModel.dart';
import 'package:flutter/material.dart';
import 'package:dpbo/widget/CustomTextField.dart';
import 'package:dpbo/widget/CustomRadioChoose.dart';
import 'package:dpbo/widget/RincianBayar.dart';
import 'package:dpbo/widget/Button.dart';
import 'package:dpbo/models/JemputSampahModel.dart';
import 'package:dpbo/models/controller.dart';

class JemputSampahForm extends StatefulWidget {
  @override
  _JemputSampahForm createState() => _JemputSampahForm();
}

class _JemputSampahForm  extends State<JemputSampahForm> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  String? _jenisSampah;
  String? _pickupMethod;
  double _ongkir = 0;
  double _biayaLayanan = 5000;
  double _totalBiaya = 0;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  void _calculateCost()  {
    setState(() {
      _totalBiaya = _ongkir + _biayaLayanan;
    });
  }

  _submitForm() {
    final db = DatabaseHelper();
    if(_formkey.currentState!.validate()) {
      // String order_number = 'EW$DateTime.now().millisecondsSinceEpoch';
      db.submitFormJemput(JemputSampah(
        // order_number: order_number,
        alamat: _alamatController.text,
        jenis_sampah: _jenisSampah!,
        keterangan: _keteranganController.text,
        berat_sampah: double.parse(_beratController.text),
        pickup_method: _pickupMethod!,
        ongkir: _ongkir,
        biaya_layanan: _biayaLayanan,
        total: _totalBiaya,
        status: 'Diproses')).whenComplete(() {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil mengajukan permintaan jemput sampah')),
      );
      _formkey.currentState!.reset();
      setState(() {
        _jenisSampah = null;
        _pickupMethod = null;
        _ongkir = 0.0;
        _totalBiaya = 0.0;
      });
    });
    }
  }

  //  void _submitForm() {
  //   if (_formkey.currentState!.validate()) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Berhasil mengajukan permintaan jemput sampah')),
  //     );
  //     _formkey.currentState!.reset();
  //     setState(() {
  //       _jenisSampah = null;
  //       _pickupMethod = null;
  //       _ongkir = 0.0;
  //       _totalBiaya = 0.0;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mari Buang Sampahmu'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                CustomTextField('Alamat', _alamatController),
                SizedBox(height: 16),
                Text('Jenis Sampah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                CustomRadioChoose('Organik', 'Organik', _jenisSampah, (String? value){setState(() {_jenisSampah = value;});}),
                CustomRadioChoose('Anorganik', 'Anorganik', _jenisSampah, (String? value){setState(() {_jenisSampah = value;});}),
                CustomTextField('Keterangan Isi Sampah', _keteranganController),
                SizedBox(height: 16),
                WeightTextField(),
                SizedBox(height: 16),
                Text('Metode Jemput Sampah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                CustomRadioChoose('Next Day - Rp 15.000', 'Next Day', _pickupMethod, (String? value){setState(() {
                  _pickupMethod = value;
                  _ongkir = 15000.0;
                  _calculateCost();});}),
                CustomRadioChoose('Same Day - Rp 20.000', 'Same Day', _pickupMethod, (String? value){setState(() {
                  _pickupMethod = value;
                  _ongkir = 20000.0;
                  _calculateCost();});}),
                SizedBox(height: 16),
                Text('Rincian Pembayaran', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                RincianBayar('Biaya Ongkir', 'Rp ${_ongkir.toStringAsFixed(0)}'),
                RincianBayar('Biaya Layanan', 'Rp ${_biayaLayanan.toStringAsFixed(0)}'),
                Divider(),
                TotalBayar(),
                SizedBox(height: 16,),
                Button('Jemput Sampahku', _submitForm)
              ],
            ),
          ),
        ),
    );
  }

  TextFormField WeightTextField() {
    return TextFormField(
      controller: _beratController,
      decoration: InputDecoration(
        labelText: 'Berat Sampah (kg)',
        border: OutlineInputBorder(),),
      keyboardType: TextInputType.number,
      validator: (value) {
        if(value == null || value.isEmpty) {
          return 'Field ini wajib diisi';
        }
        if(double.tryParse(value) == null) {
          return 'Field ini harus berupa angka';
        } return null;
      },
    );
  }

  ListTile TotalBayar() {
    return ListTile(
      title: Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold),),
      trailing: Text('Rp ${_totalBiaya.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}

