/// @function GeneratePairs
/// @param n Number of pairs to generate
/// @returns Array of pairs

function GeneratePairs(n) {
    // Starting values
    var numerator = 10;
    var denominator = 50;
    var pairs = [];
	var count = 1;

    // Add the first pair
    array_push(pairs, [numerator, denominator]);

    // Loop to generate the next n-1 pairs
    for (var i = 1; i < n; i++) {
        // Access the first element of the previous pair
        var previousNumerator = pairs[i - 1][1];
        
        // Generate the next pair
        numerator = previousNumerator + 10;
        denominator = numerator + 40;
        
        // Add the new pair to the array
        array_push(pairs, [numerator, denominator]);
    }

    return pairs;
}