class Arguments {
  final String s1Text;
  final String s2Text;
  final String s3Text;

  Arguments({
    this.s1Text = '',
    this.s2Text = '',
    this.s3Text = '',
  });

  Arguments copyWith({
    String? s1Text,
    String? s2Text,
    String? s3Text,
  }) {
    return Arguments(
      s1Text: s1Text ?? this.s1Text,
      s2Text: s2Text ?? this.s2Text,
      s3Text: s3Text ?? this.s3Text,
    );
  }
}
