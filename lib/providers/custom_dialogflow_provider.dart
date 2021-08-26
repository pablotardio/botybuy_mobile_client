import 'dart:convert';
import 'dart:io';

import 'package:flutter_dialogflow/dialogflow_v2.dart';

class CustomDialogFlowProvider {
  AuthGoogle authGoogle;
  String language;

  CustomDialogFlowProvider({this.authGoogle, this.language = "en"});

  String _getUrl() {
    return "https://dialogflow.googleapis.com/v2/projects/${authGoogle.getProjectId}/agent/sessions/${authGoogle.getSessionId}:detectIntent";
  }

  Future<AIResponse> detectIntent(String queryMessage, String payload) async {
    var response = await authGoogle.post(_getUrl(),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${authGoogle.getToken}"
        },
        body:
            "{'queryInput':{'text':{'text':'$queryMessage','language_code':'$language'}},'queryParams':{'payload': $payload}}");
    return AIResponse(body: json.decode(response.body));
  }
}
