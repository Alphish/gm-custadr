draw_set_color(collection.get_asset("Red"));
draw_text(16, 16, "RED");

for (var i = 0; i < array_length(palette); i++) {
    draw_set_color(palette[i].asset);
    draw_text(80, 16 + 32 * i, $"Palette color #{i}: {palette[i].name}");
}
