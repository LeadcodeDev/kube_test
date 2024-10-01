import 'package:mineral/api.dart';
import 'package:mineral_cache/providers/memory.dart';

void main(_, port) async {
  final client = Client()
      .setCache((e) => MemoryProvider())
      .setHmrDevPort(port)
      .build();

  client.events.ready((bot) => client.logger.info('${bot.username} is ready !  🚀'));

  await client.init();
}
