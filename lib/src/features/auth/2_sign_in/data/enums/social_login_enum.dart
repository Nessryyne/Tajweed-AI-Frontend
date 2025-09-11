enum SocialLoginSource {
  google('google'),
  facebook('facebook'),
  apple('apple');

  const SocialLoginSource(this.name);
  final String name;
}
