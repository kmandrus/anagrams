    #Phase I - Stores all possible anagrams
def first_anagram?(word_1, word_2)
    all_anagrams(word_1).include?(word_2)
end

def all_anagrams(word)
    return [word] if word.length == 1
    sub_anagrams = all_anagrams(word[0...-1])
    new_words = []
    sub_anagrams.each do |letters|
        (0..letters.length).each do |i|
            new_words << letters.dup.insert(i, word[-1])
        end
    end
    new_words
end

#What is the time complexity of this solution?
    #all_anagrams is the issue here. If we are creating all possible anagrams
    #of a word, we cannot produce fewer strings than the factorial of the
    #length of the string. This implies our solution is not less than O(n!). 
    #I certainly hope it's not doing worse than that... but I'm unsure how to 
    #analyze more deeply at my current level of knowledge.

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

    #Phase II - uses Array#delete
def second_anagram?(word_1, word_2)
    leftover_letters = word_2.dup #linear
    word_1.each_char do |char| #linear
        return false unless leftover_letters.delete!(char) #linear
    end
    leftover_letters.length == 0 #constant
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

#What is the time complexity of this solution?
    #I believe this solution runs in O(n^2). The word_1.each_char loops runs in
    #linear time, and the #delete! method also runs in linear time. (At least,
    #I imagine it does!) Because of these nested linear loops, it runs in
    #quadratic time.

    #Phase III
def third_anagram?(word_1, word_2)
    sorted_1, sorted_2 = word_1.split('').sort, word_2.split('').sort #2 x nlog(n)
    sorted_1 == sorted_2 #constant time
end
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

#What is the time complexity of this solution?
    #This solution runs in O(nlogn) time. This is based on the assumption that
    #Array#sort implements a sort fuction that runs in nlog(n) time.

    #Phase IV
def fourth_anagram?(word_1, word_2)
    count_1 = Hash.new(0) #constant time
    count_2 = Hash.new(0) #constant time
    word_1.each_char do |char| #linear time
        count_1[char] += 1 #constant time
    end
    word_2.each_char do |char| #linear time
        count_2[char] += 1 #constant time
    end
    count_1 == count_2 #constant time
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

#What is the time complexity of this solution?
    #This runs in O(n). Each hash counts up the letters in each word in
    #linear time.