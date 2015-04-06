// http://www.raywenderlich.com/82572/swift-generics-tutorial

import UIKit

struct OrderedDictionary<KeyType: Hashable, ValueType> {

    typealias ArrayType = [KeyType]
    typealias DictionaryType = [KeyType: ValueType]
    
    var array = ArrayType()
    var dictionary = DictionaryType()
    var count: Int {
        return self.array.count
    }
    
    // The method to insert a new object, insert(_:forKey:atIndex), needs to
    // take three parameters: the value for a particular key and the index at
    // which to insert the key-value pair. There is a keyword here that you
    // might not have seen before: mutating.
    
    // Structs are designed to be immutable by default, meaning you ordinarily
    // can’t mutate struct member variables in an instance method. Since that
    // is quite limiting, you can add the mutating keyword to tell the compiler
    // that the method is allowed to mutate state in the struct. This helps the
    // compiler make decisions about when to take copies of structs (they are
    // copy-on-write) and also helps document the API.
    mutating func insert(value: ValueType, forKey key: KeyType, atIndex index: Int) -> ValueType? {
        
        var adjustedIndex = index
        
        // You pass the key to the indexer of the Dictionary, which returns
        // the existing value if one already exists for that key. This insert
        // method emulates the same behavior as the Dictionary’s updateValue
        // and therefore saves the existing value for the key.
        let existingValue = self.dictionary[key]
        
        if existingValue != nil {
            
            // If there is an existing value, then and only then does the method
            // find the index into the array for that key.
            let existingIndex = find(self.array, key)!
            
            // If the existing key is before the insertion index, then you
            // need to adjust the insertion index because you’re about to
            // remove the existing key.
            if existingIndex < index {
                
                adjustedIndex--
            }
            
            self.array.removeAtIndex(existingIndex)
        }
        
        // You update the array and dictionary, as appropriate.
        self.array.insert(key, atIndex: adjustedIndex)
        self.dictionary[key] = value
        
        // Finally, you return the existing value. Since there might
        // not be an existing value, the function returns an optional
        // value.
        return existingValue
    }
    
    // Once more, this is a function that mutates the internal
    // state of the struct, and you therefore mark it as such.
    // The name removeAtIndex matches the method on Array. It’s
    // a good idea to consider mirroring the APIs of the system
    // library when appropriate. It helps make developers using
    // your API feel at home on the platform.
    mutating func removeAtIndex(index: Int) -> (KeyType, ValueType) {
        
        // First, you check the index to see if it’s within the bounds
        // of the array. Trying to remove an out-of-bounds element
        // from the underlying array will trigger a runtime error, so
        // the check here will catch that condition a bit earlier. You
        // may have used assertions in Objective-C with the assert
        // function; assert is available in Swift too, but
        // precondition is active in release builds so your shipped
        // apps will terminate if the preconditions fails.
        precondition(index < self.array.count, "Index out-of-bounds")
        
        // Next, you obtain the key from the array for the given index
        // while at the same time removing the value from the array.
        let key = self.array.removeAtIndex(index)
        
        // Then, you remove the value for that key from the
        // dictionary, which also returns the value that was present.
        // The dictionary might not contain a value for the given
        // key, so removeValueForKey returns an optional. In this
        // case, you know that the dictionary will contain a value
        // for the given key, because the only method that can add
        // to the dictionary is your own insert(_:forKey:atIndex:),
        // which you wrote. Thus you can immediately unwrap the
        // optional with ! knowing there will be a value there.
        let value = self.dictionary.removeValueForKey(key)!
        
        // Finally, you return the key and value in a tuple. This
        // parallels the behavior of Array removeAtIndex and
        // Dictionary removeValueForKey, which return the existing
        // values.
        return (key, value)
    }
    
    // This is how you add subscript behavior. Instead of func
    // or var, you use the subscript keyword. The parameter, in
    // this case key, defines the object that you expect to appear
    // inside the square brackets.
    subscript(key: KeyType) -> ValueType? {
        
        // Subscripts can comprise setters and getters, just like
        // computed properties can. Notice that this one has both (a)
        // a get and (b) a set closure, defining the getter and
        // setter, respectively.
        get {
            
            // The getter is simple: It needs to ask the dictionary for
            // the value for the given key. The dictionary’s subscript
            // already returns an optional to allow for indicating that
            // no value exists for that key.
            return self.dictionary[key]
        }
        
        set {
            
            // The setter is more complex. First, it checks if the key
            // already exists in the ordered dictionary. If it doesn’t
            // exist, then you need to add it to the array. It makes sense
            // for the new key to go at the end of the array, so you
            // add the value to the array using append.
            if let index = find(self.array, key) {
            } else {
                self.array.append(key)
            }
            
            // Finally, you add the new value to the dictionary for the
            // given key, passing in the new value via the implicitly
            // named variable newValue.
            self.dictionary[key] = newValue
        }
    }
    
    // This is similar to the subscript you added previously,
    // except that the type of the parameter is now Int, because
    // that is what you use to reference the index of an array.
    // This time, however, the return type is a tuple of key and
    // value, because that is what your OrderedDictionary stores
    // at a given index.
    subscript(index: Int) -> (KeyType, ValueType) {
        
        // This subscript only has a getter. You could implement a
        // setter for it as well, first checking that indexes that
        // are within the size range of the ordered dictionary.
        get {
            
            // The index must be within the bounds of the array, which
            // defines the length of the ordered dictionary. You use a
            // precondition to alert programmers who try to access beyond
            // the bounds of the ordered dictionary.
            precondition(index < self.array.count, "Index out-of-bound")
            
            // You find the key by obtaining it from the array.
            let key = self.array[index]
            
            // You find the value by obtaining it from the dictionary for
            // the given key. Notice, again, the use of the unwrapped
            // optional, because you know that the dictionary must contain
            // a value for any key that’s in the array.
            let value = self.dictionary[key]!
            
            // Finally, you return a tuple containing the key and value.
            return (key, value)
        }
        
        set {
            
            precondition(index < self.array.count, "Index out-of-bounds")
            
            let (key, value) = newValue
            
            self.array[index] = key
            
            self.dictionary[key] = value
        }
    }
}



var dict = OrderedDictionary<Int, String>()
dict.insert("dog", forKey: 1, atIndex: 0)
dict.insert("cat", forKey: 2, atIndex: 1)

println(dict.array.description
        + " : "
        + dict.dictionary.description)

var byIndex: (Int, String) = dict[0]
println(byIndex)

var byKey: String? = dict[2]
println(byKey)

dict.insert("dog", forKey: 3, atIndex: 2)

println(dict.array.description
    + " : "
    + dict.dictionary.description)

println(dict[2]!)
