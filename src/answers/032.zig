const std = @import("std");

fn isPandigit(digits: *std.ArrayList(u8)) bool {
    if (digits.items.len != 9) return false;
    for (1..10) |i| {
        const d: u8 = @intCast(i);
        if (std.mem.find(u8, digits.items, &.{d}) == null) return false;
    }
    return true;
}

fn numberToDigits(number: u64, list: *std.ArrayList(u8), allocator: std.mem.Allocator) anyerror!void {
    if (number == 0) {
        try list.append(allocator, 0);
        return;
    }

    var n = number;
    while (n != 0) {
        const d: u8 = @intCast(n % 10);
        try list.append(allocator, d);
        n /= 10;
    }
}

pub fn solution(allocator: std.mem.Allocator) u64 {
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(allocator);

    var products = std.AutoHashMap(u64, void).init(allocator);
    defer products.deinit();

    for (1..10) |i| {
        const a: u64 = @intCast(i);
        for (1000..10000) |j| {
            const b: u64 = @intCast(j);
            const c = a * b;
            list.clearRetainingCapacity();
            numberToDigits(a, &list, allocator) catch unreachable;
            numberToDigits(b, &list, allocator) catch unreachable;
            numberToDigits(c, &list, allocator) catch unreachable;
            if (isPandigit(&list)) products.put(c, {}) catch unreachable;
        }
    }

    for (10..100) |i| {
        const a: u64 = @intCast(i);
        for (100..1000) |j| {
            const b: u64 = @intCast(j);
            const c = a * b;
            list.clearRetainingCapacity();
            numberToDigits(a, &list, allocator) catch unreachable;
            numberToDigits(b, &list, allocator) catch unreachable;
            numberToDigits(c, &list, allocator) catch unreachable;
            if (isPandigit(&list)) products.put(c, {}) catch unreachable;
        }
    }

    var sum: u64 = 0;
    var keys = products.keyIterator();
    while (keys.next()) |k| sum += k.*;

    return sum;
}

test "isPandigit" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(gpa);

    try list.append(gpa, 1);
    try std.testing.expect(!isPandigit(&list));
    list.clearAndFree(gpa);

    for (1..10) |i| try list.append(gpa, @intCast(i));
    try std.testing.expect(isPandigit(&list));
    list.clearAndFree(gpa);

    for (1..10) |i| try list.append(gpa, @intCast(i));
    try list.append(gpa, 1);
    try std.testing.expect(!isPandigit(&list));
    list.clearAndFree(gpa);
}

test "numberToDigits" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(gpa);

    try numberToDigits(12345, &list, gpa);
    try std.testing.expectEqual(5, list.items[0]);
    try std.testing.expectEqual(4, list.items[1]);
    try std.testing.expectEqual(3, list.items[2]);
    try std.testing.expectEqual(2, list.items[3]);
    try std.testing.expectEqual(1, list.items[4]);
}
