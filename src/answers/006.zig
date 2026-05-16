const std = @import("std");
const math = std.math;

fn sum1(n: u64) u64 {
    return n * (n + 1) / 2;
}

fn sum2(n: u64) u64 {
    return n * (n + 1) * (2 * n + 1) / 6;
}

pub fn solution(n: u64) u64 {
    const a = math.powi(u64, sum1(n), 2) catch unreachable;
    const b = sum2(n);
    return a - b;
}

test "validation" {
    try std.testing.expectEqual(2640, solution(10));
}
