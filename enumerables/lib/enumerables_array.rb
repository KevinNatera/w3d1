
# #factors
# returns factors of 10 in order (FAILED - 1)
# returns just two factors for primes (FAILED - 2)


# #subwords
# can find a simple word (FAILED - 3)
# doesn't find spurious words (FAILED - 4)
# can find words within words (FAILED - 5)

# #doubler
# doubles the elements of the array (FAILED - 6)
# does not modify the original array (FAILED - 7)

class Array
# #bubble_sort!
#   works with an empty array (FAILED - 8)
#   works with an array of one item (FAILED - 9)
#   sorts numbers (FAILED - 10)
#   modifies the original array (FAILED - 11)
#   will use a block if given (FAILED - 12)
# #bubble_sort
#   delegates to #bubble_sort! (FAILED - 13)
#   does not modify the original array (FAILED - 14)

    # my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!
    def my_flatten(dimensional_array)
        return [data] if !data.is_a? Array
        final = []
        data.each { |subarr| final += my_flatten(subarr)}
        return final
    end
    
    def my_each(&prc)
        i = 0
        while (i < self.length)
            prc.call(self[i])
            i += 1
        end
        return self
    end

# #my_map
#   calls the block passed to it (FAILED - 19)
#   yields each element to the block (FAILED - 20)
#   runs the block for each element (FAILED - 21)
#   does NOT call the built in built-in #map method (FAILED - 22)
#   is chainable and returns a new array (FAILED - 23)

    def my_select(&prc)
        new_arr = []
        self.each do |ele|
            new_arr.push(ele) if prc.call(ele)
        end
        new_arr
    end

    # Write my_reject to take a block and return a new array excluding elements that satisfy the block.
    def my_reject(&prc)
        new_arr = []
        self.each do |ele|
            new_arr.push(ele) if !prc.call(ele)
        end
        new_arr
    end

    # Write my_any? to return true if any elements of the array satisfy the block 
    # and my_all? to return true only if all elements satisfy the block.
    def my_any?(&prc)
        self.each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        self.each do |ele|
            return false if !prc.call(ele)
        end
        return true
    end

# #my_inject
#   calls the block passed to it (FAILED - 28)
#   makes the first element the accumulator if no default is given (FAILED - 29)
#   yields the accumulator and each element to the block (FAILED - 30)
#   does NOT call the built-in #inject method (FAILED - 31)
#   is chainable and returns a new array (FAILED - 32)
end

# #concatenate
# returns the concatenation of the strings passed in (FAILED - 33)
# does not modify the original strings (FAILED - 34)
# uses the Array#inject method (FAILED - 35)
