
exports.sieveOfEratosthenes = function sieveOfEratosthenes(limit) {
  let sieveBound = (limit - 1) / 2;
  let bsieve = [];
  for (i = 0; i < sieveBound; i++) { bsieve.push(false); }
  let crossLimit = (Math.sqrt(limit) - 1) / 2;

  for (i = 1; i <= crossLimit; i++) {
    if (bsieve[i] == false) {
      for (j = (2 * i * (i + 1)); j <= sieveBound; j += 2 * i + 1) {
        bsieve[j] = true;
      }
    }
  }

  let sieve = [2];
  for (i = 1; i < bsieve.length; i++) {
    if (bsieve[i] == false) {
      sieve.push(2 * i + 1);
    }
  }
  return sieve;
}

