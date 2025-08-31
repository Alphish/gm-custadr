function DemoPaletteLoader() : CustadrAssetLoader() constructor {
    static load_asset = function(_data, _process) {
        static hex_to_number = {
            "0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9,
            "a": 10, "A": 10, "b": 11, "B": 11, "c": 12, "C": 12, "d": 13, "D": 13, "e": 14, "E": 14, "f": 15, "F": 15
        };
        static hex_trim = ["#"];
        
        _value = string_trim_start(_data.value, hex_trim);
        var _red = 16 * hex_to_number[$ string_char_at(_value, 1)] + hex_to_number[$ string_char_at(_value, 2)]; 
        var _green = 16 * hex_to_number[$ string_char_at(_value, 3)] + hex_to_number[$ string_char_at(_value, 4)]; 
        var _blue = 16 * hex_to_number[$ string_char_at(_value, 5)] + hex_to_number[$ string_char_at(_value, 6)];
        _process.add_asset(_data.name, "color", make_color_rgb(_red, _green, _blue));
    }
}
