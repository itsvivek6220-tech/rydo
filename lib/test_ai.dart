import 'features/ai/ai_service.dart';

void main() async {
  String reply = await AiService.getAiResponse("Hello AI, test message!");
  print(reply);
}