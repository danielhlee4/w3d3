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


