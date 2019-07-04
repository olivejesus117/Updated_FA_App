// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class MessageItem implements ListItem {
  final String heading;
  final String direction;
  final String image;
  final String playYoutube;
  final String url;

  MessageItem(this.heading, this.direction, this.image, this.playYoutube, this.url);
}

class MenuItem implements ListItem {
  final String menuOption;
  final String menuLink;

  MenuItem(this.menuOption, this.menuLink);
}