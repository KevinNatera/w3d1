require 'byebug'


class Array

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
    
    def my_zip(*args)
        final = Array.new(self.length) { Array.new() }
        
        (0...self.length).each do |i|
            final[i].push(self[i])
        end

        args.each do |subarr|
            (0...self.length).each do |k|
                if k >= self.length
                    final[k].push(nil) 
                else 
                    final[k].push(subarr[k])
                end
            end
        end
        final
    end 



    def my_reverse
        dup_self = self.dup
        new_arr = []

        self.each do |ele|
            new_arr.push(dup_self.pop())
        end
        new_arr
    end


    def my_join(separator= "")
        string = ""

        self.each_with_index do |ele,i|
            string += ele
            string += separator if i != self.length - 1
        end
        string 
    end


    def my_rotate(int = 1)
        new_arr = self.dup
        if int > 0
            (0...int).each { |what| new_arr.push(new_arr.shift()) }
        elsif int < 0
            (0...int * -1).each { |what| new_arr.unshift(new_arr.pop()) }
        end
        return new_arr
    end

    def my_map(&prc)
        dupe_array = []
        self.each do |ele|
            dupe_array.push(prc.call(ele))
        end
        dupe_array
    end

    #   #my_inject
    #   calls the block passed to it (FAILED - 2)
    #   makes the first element the accumulator if no default is given (FAILED - 3)
    #   yields the accumulator and each element to the block (FAILED - 4)
    #   does NOT call the built-in #inject method
    #   is chainable and returns a new array
    def my_inject(&prc)
        new_arr = []
        acc = self[0]
        ##acc = self[0]
        self.each do |ele|
            prc.call(ele)
        end
        new_arr
    end
    

    def bubble_sort!(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        is_sorted = false

        while !is_sorted
            is_sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    is_sorted = false
                    self[i], self[i+1] = self[i+1], self[i]
                end
            end
        end
        self
    end
  
    def bubble_sort(&prc)
        temp = self.dup
        temp.bubble_sort!(&prc)
    end

end

# #concatenate
# returns the concatenation of the strings passed in (FAILED - 33)
# does not modify the original strings (FAILED - 34)
# uses the Array#inject method (FAILED - 35)


def factors(num)
    arr = []
  
    (1..num).each do |number|
      arr << number if num % number == 0
    end
    arr
end


def doubler(array)
    array.map { |ele| ele * 2 }
end


def subwords(word, dictionary)
    substrings(word).select { |substr| dictionary.include?(substr) }
end


def substrings(string)
    arr = []
    str = ""
    
    (0...string.length).each do |i|
        (0...string.length).each do |k|
            arr.push(string[i..k]) if !arr.include?(string[i..k])
        end
    end
    arr
end


def concatenate(strings)
    strings.inject { |acc,str| acc += str }
end