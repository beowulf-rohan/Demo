class RoomKeys{
  String file_path, room_name;
  int lightsCount;
  RoomKeys(String path, String name, int count) {
    file_path = path;
    room_name = name;
    lightsCount = count;
  }
}

List<RoomKeys> rooms = [
  RoomKeys("assets/images/bed.svg", "Bed Room", 4),
  RoomKeys("assets/images/room.svg", "Living Room", 2),
  RoomKeys("assets/images/kitchen.svg", "Kitchen", 5),
  RoomKeys("assets/images/bathtube.svg", "Bathroom", 1),
  RoomKeys("assets/images/house.svg", "Outdoor", 5),
  RoomKeys("assets/images/balcony.svg", "Balcony", 2),
];
