class HistoryModel {
  String serviceType; // Contoh: "Jemput Sampah", "Antar Sampah"
  String date; // Contoh: "23-12-2024"
  double weight; // Berat sampah dalam kg
  int cost; // Biaya layanan

  HistoryModel({
    required this.serviceType,
    required this.date,
    required this.weight,
    required this.cost,
  });
}
