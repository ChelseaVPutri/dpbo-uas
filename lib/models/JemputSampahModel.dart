class JemputSampah {
  final int? jemput_id;
  // final String order_number;
  final String alamat;
  final String jenis_sampah;
  final String keterangan;
  final double berat_sampah;
  final String pickup_method;
  final double ongkir;
  final double biaya_layanan;
  final double total;
  final String status;
  JemputSampah({this.jemput_id, required this.alamat, required this.jenis_sampah, required this.keterangan, required this.berat_sampah, required this.pickup_method, required this.ongkir, required this.biaya_layanan, required this.total, required this.status});

  factory JemputSampah.fromMap(Map<String, dynamic> json) => JemputSampah(
    jemput_id: json['jemput_id'],
    // order_number: json['order_number'],
    alamat: json['alamat'],
    jenis_sampah: json['jenis_sampah'],
    keterangan: json['keterangan'],
    berat_sampah: json['berat_sampah'],
    pickup_method: json['pickup_method'],
    ongkir: json['ongkir'],
    biaya_layanan: json['biaya_layanan'],
    total: json['total'],
    status: 'Diproses',
  );

  Map<String, dynamic> toMap() => {
    'jemput_id': jemput_id,
    'alamat': alamat,
    'jenis_sampah': jenis_sampah,
    'keterangan': keterangan,
    'berat_sampah': berat_sampah,
    'pickup_method': pickup_method,
    'ongkir': ongkir,
    'biaya_layanan': biaya_layanan,
    'total': total,
  };

}