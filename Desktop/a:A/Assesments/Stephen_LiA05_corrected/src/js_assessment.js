// Write a function, `longestSymmetricSubstring(string)`, that returns the
// longest substring that is the same forwards and in reverse (for example,
// "abba"). If two substrings are the same length, take the first one.

//FIRST ONE
function longestSymmetricSubstring(string) {
if (string === string.split('').reverse().join('')) {return string}

  ans = ""
  for (var i = 0; i < string.length; i++) {
    if (string.slice(0 , i) === string.slice(0 , i).split('').reverse().join('')){
      ans = string.slice(0 , i)
    }
  }
  return ans;
}

// Write an Array function, myEach(callback), that passes each element to
// `callback` and does not modify the original array. Do NOT call the built-in
// Array#forEach method in your implementation.

Array.prototype.myEach = function(callback){
  for (var i = 0; i < this.length; i++) {
    callback(this[i])
  }
}

// Write a an Array method, myMap, that takes a callback and returns a new array
// containing the result of the callback for each element in the array. Use the
// Array#myEach method you defined above. Do NOT call the built-in Array#forEach
// or Array#map methods in your implementation.


Array.prototype.myMap = function(callback) {
  let ans = [];
  this.myEach( (e) => {
    ans.push(callback(e))
  })

  return ans;

}

// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.

// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }


function pairMatch(array, callback) {
  let ans = [];
    for (var i = 0; i < array.length; i++) {
      for (var j = 0; j < array.length; j++) {
        if (callback(array[i], array[j]) && (i != j)){
          ans.push([i,j]);
        }
      }
    }
    return ans;
}


// Write a function, `binarySearch(sortedArray, target)`, that returns the
// index of `target` in `sortedArray`, or -1 if it is not found.
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.


function binarySearch(sortedArray, target){
  if (sortedArray.length === 0) {return -1};

  let mid = Math.floor(sortedArray.length / 2)

  if (sortedArray[mid] === target) {return mid};

  if (sortedArray[mid] > target){
    let left = sortedArray.slice(0, mid);
    return binarySearch(left, target);
  } else {
    let right = sortedArray.slice(mid + 1);
    let result = binarySearch(right, target);
    return result === -1 ? -1 : result + mid + 1
  }
// negative 1 got me good.
}

// write a Function method, myBind(context). It should return a copy of the
// original function, where `this` is set to `context`.

Function.prototype.myBind = function(context, ...arg) {
  let that = this;
  return function (...callarg) {
    return that.call(context, ...arg, ...callarg)
  }
}

// write a method, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`.

function inherits(ChildClass, ParentClass) {
  function Surrogate(){};
  Surrogate.prototype = ParentClass.prototype;
  ChildClass.prototype = new Surrogate();
  ChildClass.prototype.constructor = ChildClass;
}

// write a method, `myCurry(fn, object, numArgs)`, that curries the
// function. Remember that a curried function is invoked with one argument at a
// time. For example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

//
function myCurry(fn, object, numArgs) {
  let ans = [];

  function _myCurry(...arg) {
    ans.push(...arg);
    if (ans.length >= numArgs) {
      let new_ans = ans.slice(0, numArgs)
      return fn.call(object, ...new_ans);
    } else{
      return _myCurry;
    }
  }
  return _myCurry;
}

// had to just redo it and know object was the context
