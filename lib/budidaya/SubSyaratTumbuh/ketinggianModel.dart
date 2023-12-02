class Ketinggian {
  final List<KetinggianItem> items;

  Ketinggian({required this.items});

  factory Ketinggian.fromJSON(List<dynamic> json) {
    List<KetinggianItem> items = [];
    for (var item in json) {
      items.add(KetinggianItem.fromJSON(item));
    }
    return Ketinggian(items: items);
  }
}

class KetinggianItem {
  final int id;
  final String tahapan;
  final String deskripsi;
  final String link;
  final String sumber_artikel;
  final String credit_gambar;
  final String gambar;

  KetinggianItem({
    required this.id,
    required this.tahapan,
    required this.deskripsi,
    required this.link,
    required this.sumber_artikel,
    required this.credit_gambar,
    required this.gambar,
  });

  factory KetinggianItem.fromJSON(Map<String, dynamic> json) {
    return KetinggianItem(
      id: json['id'],
      tahapan: json['tahapan'],
      deskripsi: json['deskripsi'],
      link: json['link'],
      sumber_artikel: json['sumber_artikel'],
      credit_gambar: json['credit_gambar'],
      gambar: json['gambar'],
    );
  }
}
