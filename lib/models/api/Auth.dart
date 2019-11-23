class Auth {
  final String accessToken;
  final String tokenType;
  final String scope;
  final int expiresIn;
  final String refreshToken;

  Auth(this.accessToken, this.tokenType, this.scope, this.expiresIn, this.refreshToken);

  Auth.fromJson(Map<String, dynamic> json) 
    : accessToken = json['access_token'],
      tokenType = json['token_type'],
      scope = json['scope'],
      expiresIn = json['expires_in'],
      refreshToken = json['refresh_token'];

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'token_type': tokenType,
    'scope': scope,
    'expires_in': expiresIn,
    'refresh_token': refreshToken
  };


}