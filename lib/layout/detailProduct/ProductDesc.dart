import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail",
            style: AppText.subheader(),
          ),
          SizedBox(height: 8),
          Text(
            "Kondisi : Baru\nBerat Satuan : 1 g\nKategori : Daur Ulang\nEtalase : Gilingan Plastik\nJumlah barang : 99++\n\nKami menjual biji plastik\nPP\nHD\nPE\nDari bahan Inject, PK, Sablon, Abu\nGilingan Kasar atau halus bisa diterima",
            style: AppText.subtitle(
              lineHeight: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
