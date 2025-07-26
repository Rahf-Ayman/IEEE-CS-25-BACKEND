function getMaxLessThanK(n, k) {
    let max = 0;
    for (let i = 1; i <= n; i++) {
        for (let j = i + 1; j <= n; j++) { // j > i avoids duplicates and i == j
            let bit = i & j;
            if (bit < k && bit > max) {
                max = bit;
            }
        }
    }
    return max;
}