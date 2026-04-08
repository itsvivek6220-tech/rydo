import 'dart:convert';
import 'package:http/http.dart' as http;

class AiService {
  static const String openAiApiKey = '
  // AI Chat request using Chat Completions API
  static Future<String> getAiResponse(String message) async {
    try {
      final url = Uri.parse("https://api.openai.com/v1/chat/completions");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAiApiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": message}
          ],
          "temperature": 0.7,
          "max_tokens": 150
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].toString();
      } else {
        print(response.body); // 🔹 debug output
        return "AI service failed. Please try again.";
      }
    } catch (e) {
      print(e); // 🔹 debug error
      return "AI service failed. Check your internet or API key.";
    }
  }

  static double calculateFare(double distanceKm) {
    const baseFare = 50.0;
    const perKm = 10.0;
    return baseFare + distanceKm * perKm;
  }
}