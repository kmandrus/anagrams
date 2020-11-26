    #Phase I
    #Stores all possible anagrams
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
    
    #Tests
#anagram?("gizmo", "sally")    #=> false
#anagram?("elvis", "lives")    #=> true