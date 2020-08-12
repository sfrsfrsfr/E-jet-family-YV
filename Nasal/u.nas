# u.nas - a collection of Nasal utility routines.

## UTF-8

globals.utf8NumBytes = func (c) {
    if ((c & 0x80) == 0x00) { return 1; }
    if ((c & 0xE0) == 0xC0) { return 2; }
    if ((c & 0xF0) == 0xE0) { return 3; }
    if ((c & 0xF8) == 0xF0) { return 4; }
    printf("UTF8 error (%d / %02x)", c, c);
    return 1;
};

## Unit conversions

globals.celsiusToFahrenheit = func (c) {
    return 32.0 + c * 1.8;
};

## Formatting and parsing

globals.parseOctal = func (s) {
    var val = 0;
    for (var i = 0; i < size(s); i += 1) {
        val = val * 8;
        var c = s[i];
        if (c < 48 or c > 55) {
            return nil;
        }
        val += c - 48;
    }
    return val;
};

## Collections

globals.vecfind = func (needle, haystack) {
    forindex (var i; haystack) {
        if (haystack[i] == needle) {
            return i;
        }
    }
    return -1;
};

globals.prepended = func (val, vec) {
    var result = [val];
    foreach (var v; vec) {
        append(result, v);
    }
    return result;
};

globals.vconcat = func (vec1, vec2) {
    var vec = [];
    foreach (var elem; vec1) { append(vec, elem); }
    foreach (var elem; vec2) { append(vec, elem); }
    return vec;
};
