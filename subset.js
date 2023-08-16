// Returns maximum size of subset with no pair
// sum divisible by K
function subsetPairNotDivisibleByK(arr, N, K) {
  // Array for storing frequency of modulo
  // values
  let f = new Array(K);
  for (let i = 0; i < K; i++) {
    f[i] = 0;
  }

  // Fill frequency array with values modulo K
  for (let i = 0; i < N; i++) f[arr[i] % K]++;

  // if K is even, then update f[K/2]
  if (K % 2 == 0) f[K / 2] = Math.min(f[K / 2], 1);

  // Initialize result by minimum of 1 or
  // count of numbers giving remainder 0
  let res = Math.min(f[0], 1);

  // Choose maximum of count of numbers
  // giving remainder i or K-i
  for (let i = 1; i <= K / 2; i++) res += Math.max(f[i], f[K - i]);

  return res;
}
