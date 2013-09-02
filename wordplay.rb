# Splitting Text into Sentences
class String
  def sentences
    self.gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
  
  def words
    self.scan(/\w[\w\'\-]*/)
  end
end
class WordPlay
 # Switching Subject and Object Pronouns # swap “you” and “I,” “I” and “you,” “my” and “your,” and “your” and “my.”
  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
    case pronoun.downcase
      when "i"
        "you"
      when "you"
        "me"
      when "me"
        "you"
      when "i am"
        "you are"
      when "you are"
        "i am"
      when "your"
        "my"
      when "my"
        "your"
    end
  end.sub(/^me\b/i, 'i')
end


# Test 
p %q{Hello. This is a test of basic sentence splitting. It even works over multiple lines.}.sentences


# Test
p "This is a test of words' capabilities".words
# This test picks out the second sentence with sentences[1], and then the fourth word with words[3
p %q{Hello. This is a test of basic sentence splitting. It even works over multiple lines}.sentences[1].words[3]

# Word Matching
# define two “hot” words that you want to find within sentences, and you look through the sentences in my_string for any that contain either of your hot words. 
hot_words = %w{test ruby}
my_string = "This is a test. Dull sentence here. Ruby is great. So is cake."
my_string.sentences.find_all do |s|
  s.downcase.words.any? { |word| hot_words.include?(word) }
end

def self.best_sentence(sentences, desired_words)
  ranked_sentences = sentences.sort_by do |s|
    s.words.length - (s.downcase.words - desired_words).length
end

ranked_sentences.last
end
end



