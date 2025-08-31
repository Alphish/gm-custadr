function CustadrAssetCollection(_keyby = string) constructor {
    assets_by_name = {};
    assets_by_type = {};
    assets_by_fullname = {};
    key_selector = _keyby;
    
    packages = [];
    
    static add_package = function(_package) {
        array_push(packages, _package);
        var _assets = _package.assets;
        for (var i = 0, _count = array_length(_assets); i < _count; i++) {
            var _asset_info = _assets[i];
            
            var _name = key_selector(_asset_info.name);
            assets_by_name[$ _name] = _asset_info;
            
            var _type = key_selector(_asset_info.type);
            assets_by_type[$ _type] ??= [];
            array_push(assets_by_type[$ _type], _asset_info);
            
            var _fullname = key_selector(_asset_info.get_fullname());
            assets_by_fullname[$ _fullname] = _asset_info;
        }
    }
    
    static has_asset = function(_name) {
        var _key = key_selector(_name);
        return struct_exists(assets_by_fullname, _key) || struct_exists(assets_by_name, _key);
    }
    
    static get_asset_info = function(_name) {
        var _key = key_selector(_name);
        return assets_by_fullname[$ _key] ?? assets_by_name[$ _key];
    }
    
    static get_asset = function(_name) {
        var _info = get_asset_info(_name);
        return !is_undefined(_info) ? _info.asset : _info;
    }
    
    static get_asset_info_list = function(_type) {
        return assets_by_type[$ _type] ?? [];
    }
    
    static get_asset_list = function(_type) {
        var _asset_infos = get_asset_info_list(_type);
        return array_map(_asset_infos, function(_info) { return _info.asset; });
    }
}
