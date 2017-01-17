function prime(input) {
  var flag = 0;
  for (var i = input - 1; i > 1; i--) {
    if (input % i === 0) {
      flag = 1;
      // break;
    }
  }
  if (flag === 1) {
    console.log(input + " is not a prime number.");
  } else {
    console.log(input + " is a prime number");
  }
}

function slowPrime(input) {
  var flag = 0;
  for (var i = input - 1; i > 1; i--) {
    if (input % i === 0) {
      flag = 1;
      break;
    }
  }
  if (flag === 1) {
    console.log(input + " is not a prime number.");
  } else {
    console.log(input + " is a prime number");
  }
}

for (var i = 0; i < 1000; i++) {
  prime(i);
}
