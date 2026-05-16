const std = @import("std");
const math = std.math;

fn isTriplet(a: u64, b: u64, c: u64) bool {
    return a * a + b * b == c * c;
}

pub fn solution(n: u64) u64 {
    if (n < 3) return 0;
    const lim1 = n;
    for (1..lim1 + 1) |a| {
        const lim2 = n - a;
        for (1..lim2 + 1) |b| {
            const c = n - a - b;
            if (isTriplet(a, b, c)) return a * b * c;
        }
    }
    return 0;
}

test "validation" {
    try std.testing.expect(isTriplet(3, 4, 5));
    try std.testing.expectEqual(60, solution(12));
}
