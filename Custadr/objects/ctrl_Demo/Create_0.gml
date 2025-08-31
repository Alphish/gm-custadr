package_loader = new CustadrPackageLoader();
package_loader.add_asset_loader("color", new DemoPaletteLoader());

package = package_loader.load({
    "name": "Cool Colors Palette",
    "assets": [
        { "$type": "color", name: "red", value: "#ff0000" },
        { "$type": "color", name: "green", value: "#00ff00" },
        { "$type": "color", name: "BLUE", value: "#0000ff" },
    ]
});
collection = new CustadrAssetCollection(/* key selector */ string_lower);
collection.add_package(package);

palette = collection.get_asset_info_list("color");
