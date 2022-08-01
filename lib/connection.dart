import 'dart:io';
import 'global_Data.dart' as globalData;

class connection {
  void sendServer(String msg) async {
    try {
      final socket = await Socket.connect(
          globalData.targetIp, int.parse(globalData.targetPort));
      socket.write(msg);
      socket.destroy();
    } catch (e) {}
  }
}
