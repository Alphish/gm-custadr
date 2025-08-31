function CustadrAssetLoader() constructor {
    static load_asset = function(_data, _process) {
        throw CustadrException.not_implemented(self, nameof(load_asset));
    }
}
