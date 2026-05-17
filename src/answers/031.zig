const std = @import("std");
const math = std.math;

pub fn solution(n: u64) u64 {
    var count: u64 = 0;

    var sum: u64 = 0;
    while (true) {
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
                                    sum = p200 * 200 + p100 * 100 + p50 * 50 + p20 * 20 + p10 * 10 + p5 * 5 + p2 * 2;
                                    if (sum <= n) count += 1;
                                    if (sum > n) break;
                                    p2 += 1;
                                }
                                sum = p200 * 200 + p100 * 100 + p50 * 50 + p20 * 20 + p10 * 10 + p5 * 5;
                                if (sum > n) break;
                                p5 += 1;
                            }
                            sum = p200 * 200 + p100 * 100 + p50 * 50 + p20 * 20 + p10 * 10;
                            if (sum > n) break;
                            p10 += 1;
                        }
                        sum = p200 * 200 + p100 * 100 + p50 * 50 + p20 * 20;
                        if (sum > n) break;
                        p20 += 1;
                    }
                    sum = p200 * 200 + p100 * 100 + p50 * 50;
                    if (sum > n) break;
                    p50 += 1;
                }
                sum = p200 * 200 + p100 * 100;
                if (sum > n) break;
                p100 += 1;
            }
            sum = p200 * 200;
            if (sum > n) break;
            p200 += 1;
        }
        if (sum > n) break;
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
