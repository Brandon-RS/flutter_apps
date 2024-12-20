class Assets {
  Assets._();

  static const images = $AssetsImagesGen();
  static const env = $EnvGen();
}

class $EnvGen {
  const $EnvGen();

  String get envDev => 'env/env.dev';

  String get envProd => 'env/env.prod';

  List<String> get values => [envDev, envProd];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get oppsIcon => const AssetGenImage('assets/images/opps-icon.png');

  List<AssetGenImage> get values => [oppsIcon];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  String get path => _assetName;
}
