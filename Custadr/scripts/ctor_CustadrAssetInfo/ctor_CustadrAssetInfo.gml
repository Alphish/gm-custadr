function CustadrAssetInfo(_name, _type, _asset, _details = undefined) constructor {
    name = _name;
    type = _type;
    asset = _asset;
    details = _details;
    package = undefined;
    
    static get_fullname = function() {
        if (is_undefined(package) || is_undefined(package.name) || package.name == "")
            return name;
        else
            return $"{package.name}.{name}";
    }
}
