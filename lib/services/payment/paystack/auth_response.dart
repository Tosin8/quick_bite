// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PayStackAuthResponse {
  final String authorizaton_url; 
  final String access_code; 
  final String reference; 
  PayStackAuthResponse({required this.authorizaton_url, required this.access_code, required this.reference});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'authorizaton_url': authorizaton_url,
      'access_code': access_code,
      'reference': reference,
    };
  }

  factory PayStackAuthResponse.fromJson(Map<String, dynamic> json) {
    return PayStackAuthResponse(
      authorizaton_url: json['authorizaton_url'], 
      access_code: json['access_code'], 
      reference: json['reference'], 
    );
  }


}
