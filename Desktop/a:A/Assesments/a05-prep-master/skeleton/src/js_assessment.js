// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function (start, end) {
  if (start > end){ return ""};
  if (!end){ end = this.length};
  if (end > this.length) {end = this.length}
  ans = "";

  for (var i = start; i < end; i++) {
    ans += (this[i]);
  }

  return ans;
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

 Array.prototype.myReduce = function (callback, acc) {
   if (acc === undefined){ acc = this.shift();}

   for (let i = 0; i < this.length; i++) {
     acc = callback(acc, this[i]);
   }

   return acc;
 }


// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.


Array.prototype.quickSort = function(func) {
  if (this.length <= 1) {return this}
  if (func === undefined)(func = (x,y) => {
    if(x < y) {return - 1};
  });

  let pivot = this[0]
  let left = []
  let right = []

  for (var i = 1; i < this.length; i++) {
    if (func(this[i] , pivot) === -1){
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  return left.quickSort(func).concat(pivot).concat(right.quickSort(func))
}


// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

function myFind(array, callback) {
for (var i = 0; i < array.length; i++) {
  if (callback(array[i])) {return array[i]}
}
  return undefined
}


function sumNPrimes(n) {
  let sum = 0;
  let i = 0;
  let count = 0;

  while (count < n){
    if (prime(i)){
      sum += i;
      count += 1
    }
    i += 1;
  }
  return sum;
}

function prime(n){
  if (n < 2) {return false}
  for (var i = 2; i < n; i++) {
    if (n % i === 0) {return false}
  }
  return true
}



Function.prototype.myBind = function(ctx, ...arg) {
  let that = this;
  return function(...call) {
    return that.call(ctx, ...arg, ...call);
  }
}

Function.prototype.inherits = function(parent) {
  function Surrogate(){};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}
