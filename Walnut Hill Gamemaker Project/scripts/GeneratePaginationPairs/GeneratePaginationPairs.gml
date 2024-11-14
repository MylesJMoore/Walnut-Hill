/// @function GeneratePaginationPairs
/// @param n Number of pairs to generate
/// @returns Array of pairs

function GeneratePaginationPairs(n) {
    // Starting values
    var numerator = 0;
    var denominator = 7;
    var pairs = [];
    
    // Add the first pair
    array_push(pairs, [numerator, denominator]);

    // Loop to generate the next n-1 pairs
    for (var i = 1; i < n; i++) {
        // Generate the next pair
        numerator = numerator + 8;
        denominator = numerator + 7;
        
        // Add the new pair to the array
        array_push(pairs, [numerator, denominator]);
    }

    return pairs;
}