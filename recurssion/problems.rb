require "byebug"

def iter_range(start, end_ele)
    if end_ele < start
        return []
    end

    new_arr = []
    (start...end_ele).each do |i|
        new_arr << i
    end

    new_arr
end

# p iter_range(1, 5)

def rec_range(start, end_ele)
    return [] if start == end_ele

    rec_range(start, end_ele - 1) << end_ele - 1
end

# p rec_range(1, 1) # =>  [ ]
# p rec_range(1, 2) # =>  [1]
# p rec_range(1, 3) # =>  [1, 2]
# p rec_range(1, 4) # =>  [1, 2, 3]

def exp(b,n)
    #base case
    return 0 if b==0 && n==0
    return 1 if n ==0
    return b if n ==1 

    #inductive step
    exp(b,n-1) *b
end

def exp_better(b,n)
    #base case
    return 0 if b==0 && n==0
    return 1 if n ==0
    return b if n ==1 

    #inductive step
    return exp(b,n/2)**2 if n.even?
    (exp(b, (n - 1) / 2) ** 2) *b if n.odd?
end

# p exp(0,0) #=> 0
# p exp(0,1) #=> 0
# p exp(1,0) #=> 1
# p exp(1,1) #=> 1
# p exp(1,2) #=> 1 => exp(1,1) * 1
# p exp(2,0) #=> 1 =>
# p exp(2,1) #=> 2
# p exp(2,2) #=> 4 => exp(2,1) * 2
# p exp(2,8)
class Array

    def dup
        #base case
        return self if !self.is_a?(Array) 
        # below this line, self is an array
        dup_arr = []
        self.each do |ele|
            dup_arr << ele.dup
        end

        dup_arr
    end
end

# a = [1, 2, [2, 3] ]
# b = a.dup
# b[2] << 4
# p a # [1, 2, [2, 3] ]
# p b # [1, 2, [2, 3, 4] ]

# p a.object_id
# p b.object_id
# p a[2].object_id
# p b[2].object_id

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# robot_parts_copy[1] << "LEDs"

# p robot_parts[1] # => ["capacitors", "resistors", "inductors"]


def itr_fibs(n)
    return [0] if n ==1
    return [0,1] if n ==2
    
    fib = [0,1]
    #n =4 
    #n =3 [0,1,1]
    #n = 4  [0,1,1,2]

    (0..n-3).each do |i|
        fib << fib[i]+fib[i+1]
    end
    fib

end


# p itr_fibs(1) #=> [0]
# p itr_fibs(2) #=> [0,1]
# p itr_fibs(3) #=> [0,1,1]
# p itr_fibs(4) #=> [0,1,1,2]
# p itr_fibs(5) #=> [0,1,1,2,3]
# p itr_fibs(6) #=> [0,1,1,2,3,5]

def rec_fibs(n)
    #base case
    return [0] if n ==1
    return [0,1] if n ==2

    #inductive step
    prev_fib = rec_fibs(n-1)
    prev_fib << prev_fib[-1] + prev_fib[-2]
    prev_fib
end


# p rec_fibs(1) #=> [0]
# p rec_fibs(2) #=> [0,1]
# p rec_fibs(3) #=> [0,1,1] rec_fibs(2) << rec_fibs(2)[-1]+rec_fibs(2)[-2]
# p rec_fibs(4) #=> [0,1,1,2]
# p rec_fibs(5) #=> [0,1,1,2,3]
# p rec_fibs(6) #=> [0,1,1,2,3,5]

def bsearch(array, target)
    #base case
    return array.length / 2 if array[ array.length / 2 ] == target
    return nil if array.length ==1 && array[0] != target

    #inductive step
    idx = array.length / 2
    
    if array[idx] < target
        if bsearch(array[idx + 1..-1], target)==nil
            return nil
        else
            return idx+ bsearch(array[idx + 1..-1], target) +1
            # if (array.length-1-idx) %2 ==0
            #     return idx+ bsearch(array[idx + 1..-1], target) +1
            # else
            #     return idx+ bsearch(array[idx + 1..-1], target)
            # end
        end
    
    else
        if bsearch(array[0..idx], target) ==nil
            return nil
        else
            return idx - bsearch(array[0..idx], target)
        
            # if (idx) %2 ==0
            #     return idx - bsearch(array[0...idx], target) 
            # else
            #     return idx - bsearch(array[0...idx], target) -1
            # end

        end
        
    end
end


p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
# 4 != 5
# since 4 < 5, check upper half
# will now run bsearch on [index(4) + 1 .. -1]
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

