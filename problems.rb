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


    #Tests
#anagram?("gizmo", "sally")    #=> false
#anagram?("elvis", "lives")    #=> true