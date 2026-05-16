const std = @import("std");
const math = std.math;

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    var d: u64 = 3;
    while (d * d <= n) {
        if (n % d == 0) return false;
        d += 2;
    }

    return true;
}

pub fn solution(n: u64) u64 {
    var count: u64 = 0;
    var p: u64 = 0;
    while (count < n) {
        p += 1;
        if (isPrime(p)) count += 1;
    }
    return p;
}

test "validation" {
    try std.testing.expectEqual(2, solution(1));
    try std.testing.expectEqual(3, solution(2));
    try std.testing.expectEqual(5, solution(3));
    try std.testing.expectEqual(7, solution(4));
    try std.testing.expectEqual(11, solution(5));
    try std.testing.expectEqual(13, solution(6));
}
