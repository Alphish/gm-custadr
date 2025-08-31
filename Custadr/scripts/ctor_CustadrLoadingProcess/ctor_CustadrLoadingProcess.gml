function CustadrLoadingProcess(_loader, _data) constructor {
    package_loader = _loader;
    data = _data;
    
    package_name = undefined;
    assets = [];
    key_selector = string;
    details = undefined;
    
    pending_actions = [];
    
    static set_package_name = function(_name) {
        package_name = _name;
    }
    
    static add_asset = function(_name, _type, _asset, _details = undefined) {
        var _info = new CustadrAssetInfo(_name, _type, _asset, _details);
        array_push(assets, _info);
    }
    
    static set_details = function(_details) {
        details = _details;
    }
    
    static add_detail = function(_name, _value) {
        details ??= {};
        details[$ _name] = _value;
    }
    
    static add_action = function(_action, _item) {
        array_push(pending_actions, _action, _item);
    }
    
    static insert_action = function(_action, _item) {
        array_insert(pending_actions, 0, _action, _item);
    }
    
    static run_next = function() {
        var _action = array_shift(pending_actions);
        var _item = array_shift(pending_actions);
        _action(_item, self);
        return array_length(pending_actions) == 0;
    }
    
    static run_to_end = function() {
        while (!run_next()) {
            // proceed
        }
    }
    
    static create_package = function() {
        return new CustadrPackage(package_name, assets, details); 
    }
}
