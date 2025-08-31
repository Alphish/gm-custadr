function CustadrPackage(_name, _assets, _keyby = string, _details = undefined) constructor {
    name = _name;
    assets = _assets;
    details = undefined;
    
    assets_by_name = {};
    key_selector = _keyby;
    
    for (var i = 0, _count = array_length(assets); i < _count; i++) {
        var _asset = assets[i];
        _asset.package = self;
        var _key = key_selector(_asset.name);
        assets_by_name[$ _key] = _asset;
    }
    
    static has_asset = function(_name) {
        var _key = key_selector(_name);
        return struct_exists(assets_by_name, _key);
    }
    
    static get_asset = function(_name) {
        var _key = key_selector(_name);
        return assets_by_name[$ _key];
    }
}
