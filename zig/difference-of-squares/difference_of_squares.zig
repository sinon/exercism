const std = @import("std");

pub fn squareOfSum(number: usize) usize {
    var total: usize = 0;
    for (1..number + 1) |i| {
        total += i;
    }
    return total * total;
}

pub fn sumOfSquares(number: usize) usize {
    var total: usize = 0;
    for (1..number + 1) |i| {
        total += i * i;
    }
    return total;
}

pub fn differenceOfSquares(number: usize) usize {
    const sumSq = sumOfSquares(number);
    const sqSum = squareOfSum(number);
    return @abs(sqSum - sumSq);
}
