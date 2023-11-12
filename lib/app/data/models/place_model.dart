class Place
{
  final String name;
  final String type;
  final String governorate;
  final String description;
  final int open;
  final int close;
  final String free;
  final double lat;
  final double lng;
  final int views;

  Place ({
    required this.views,required this.name, required this.type, required this.governorate, required this.description, required this.open, required this.close, required this.free, required this.lat,required this.lng
  });
}