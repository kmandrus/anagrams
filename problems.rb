    #Phase I
    #Stores all possible anagrams
def first_anagram?(word_1, word_2)
    all_scramblings(word_1).include?(word_2)
end

def all_scramblings(word)
    return [word] if word.length == 1
    scramblings = all_scramblings(word[0...-1])
    last_letter = word[-1]
    new_words = []
    scramblings.each do |letters|
        (0..letters.length).each do |i|
            new_words << letters.dup.insert(i, last_letter)
        end
    end
    new_words
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
    
    #Tests
#anagram?("gizmo", "sally")    #=> false
#anagram?("elvis", "lives")    #=> true