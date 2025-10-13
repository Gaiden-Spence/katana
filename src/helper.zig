const std = @import("std");

pub fn normalizeDim(dim: isize, n_dims: usize) !usize {
    if (dim >= 0) {
        const udim = @as(usize, @intCast(dim));
        if (udim >= n_dims) return error.InvalidDimension;
        return udim;
    } else {
        const adjusted = @as(isize, @intCast(n_dims)) + dim;
        if (adjusted < 0) return error.InvalidDimension;
        return @as(usize, @intCast(adjusted));
    }
}

pub fn product(arr: []usize) usize {
    var result: usize = 1;
    for (arr) |value| {
        result *= value;
    }
    return result;
}

pub fn normalAxis(tensor_length: usize, axis: ?isize) usize {
    const normalized_axis = if (axis.? < 0)
        @as(usize, @intCast(@as(isize, @intCast(tensor_length)) + axis.?))
    else
        @as(usize, @intCast(axis.?));

    return normalized_axis;
}