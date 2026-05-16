const std = @import("std");

pub fn solution(n: u64, allocator: std.mem.Allocator) u64 {
    var list: std.ArrayList(u64) = .empty;
    defer list.deinit(allocator);
    for (0..n) |i| list.append(allocator, i + 1) catch unreachable;

    var ans: u64 = 1;
    for (0..n) |i| {
        const num = list.items[i];
        ans *= num;
        for (i..n) |j| {
            if (list.items[j] % num == 0) list.items[j] /= num;
        }
    }

    return ans;
}

test "validation" {
    const gpa = std.testing.allocator;
    try std.testing.expectEqual(2520, solution(10, gpa));
}
