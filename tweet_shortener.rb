require 'pry'

def dictionary
  word_hash = {
    "hello" => 'hi',
    "to" => 2,
    "two" => 2,
    "too" => 2,
    "for" => 4,
    "four" => 4,
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&",
  }

end

def word_substituter(tweet)
  if tweet.is_a? String
    tweet_array = tweet.split(" ")
    tweet_array.each do |word|
      dc = word.downcase
      dictionary.each do |k, v|
        if k == word || k == dc
          word.replace dictionary[k].to_s
        end
      end
    end
    return tweet_array.join(" ")
  end
end

def bulk_tweet_shortener(array_of_tweets)
  array_of_tweets.each do |sentence|
  puts word_substituter(sentence)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length <= 140
    return tweet
  else
    word_substituter(tweet)
  end
end

def shortened_tweet_truncator(tweet)
  shortened_tweet = word_substituter(tweet)
  if tweet.length < 140
    return tweet
  elsif shortened_tweet.length > 140
    return shortened_tweet.replace(shortened_tweet[0..136] + "...")
  end
end
