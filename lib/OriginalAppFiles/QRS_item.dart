abstract class QRSItem {}

// A ListItem that contains data to display a heading
class QRSobject implements QRSItem {
  final String disease;
  final String level;
  final String duration;

  QRSobject(this.disease, this.level, this.duration);
}