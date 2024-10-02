import 'package:mineral/api.dart';
import 'package:mineral_cache/providers/memory.dart';

void main(_, port) async {
  final client = Client().setCache((e) => MemoryProvider()).setHmrDevPort(port).build();

  client.events.ready((bot) => client.logger.info('${bot.username} is ready !  🚀'));
  client.events.server
      .serverCreate((server) => client.logger.info('Server created: ${server.name}'));

  client.events.server.messageCreate((message) async {
    if (message.author.isBot) return;
    await message.reply(content: 'Pong !');
  });

  await client.init();
}
