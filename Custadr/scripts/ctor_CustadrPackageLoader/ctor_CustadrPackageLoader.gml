function CustadrPackageLoader() constructor {
    asset_loaders_by_type = {};
    
    static add_asset_loader = function(_name, _loader) {
        asset_loaders_by_type[$ _name] = _loader;
    }
    
    static begin_load = function(_data) {
        var _process = new CustadrLoadingProcess(self, _data);
        setup_process(_process);
        return _process;
    }
    
    static load = function(_input) {
        var _process = is_instanceof(_input, CustadrLoadingProcess) ? _input : begin_load(_input);
        _process.run_to_end();
        return _process.create_package();
    }
    
    static setup_process = function(_process) {
        var _data = _process.data;
        _process.set_package_name(_data.name);
        _process.set_details(_data[$ "details"]);
        
        var _assets = _data.assets;
        var _load_asset_method = method(self, self.load_asset);
        for (var i = 0, _count = array_length(_assets); i < _count; i++) {
            _process.add_action(_load_asset_method, _assets[i]);
        }
    }
    
    static load_asset = function(_data, _process) {
        var _loader = choose_asset_loader(_data);
        _loader.load_asset(_data, _process);
    }
    
    static choose_asset_loader = function(_data) {
        var _type = _data[$ "$type"];
        return asset_loaders_by_type[$ _type];
    }
}
