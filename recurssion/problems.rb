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

p rec_range(1, 1) # =>  [ ]
p rec_range(1, 2) # =>  [1]
p rec_range(1, 3) # =>  [1, 2]
p rec_range(1, 4) # =>  [1, 2, 3]