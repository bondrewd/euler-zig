const std = @import("std");
const math = std.math;

pub fn solution(n: u64) u64 {
    var count: u64 = 0;

    var p200: u64 = 0;
    while (true) {
        var p100: u64 = 0;
        while (true) {
            var p50: u64 = 0;
            while (true) {
                var p20: u64 = 0;
                while (true) {
                    var p10: u64 = 0;
                    while (true) {
                        var p5: u64 = 0;
                        while (true) {
                            var p2: u64 = 0;
                            while (true) {
                                const sum: u64 = p200 + p100 + p50 + p20 + p10 + p5 + p2;
                                if (sum <= n) count += 1;
                                if (sum > n) break;
                                p2 += 2;
                            }
                            if (p200 + p100 + p50 + p20 + p10 + p5 > n) break;
                            p5 += 5;
                        }
                        if (p200 + p100 + p50 + p20 + p10 > n) break;
                        p10 += 10;
                    }
                    if (p200 + p100 + p50 + p20 > n) break;
                    p20 += 20;
                }
                if (p200 + p100 + p50 > n) break;
                p50 += 50;
            }
            if (p200 + p100 > n) break;
            p100 += 100;
        }
        if (p200 > n) break;
        p200 += 200;
    }

    return count;
}

test "validation" {
    try std.testing.expectEqual(1, solution(1));
    try std.testing.expectEqual(2, solution(2));
    try std.testing.expectEqual(2, solution(3));
    try std.testing.expectEqual(3, solution(4));
    try std.testing.expectEqual(4, solution(5));
}
