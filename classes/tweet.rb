class Tweet
  attr_accessor :zombie, :content, :location, :created_at, :tweet_id

  @@tweet_id = 1
  @@all_tweets = []

  def initialize
    @unique_id = @@tweet_id
    @@tweet_id += 1
  end

  def self.find_tweet(unique_id)
    matching_tweet = nil
    @@all_tweets.each do | tweet |
      if tweet.unique_id == unique_id
        matching_tweet = tweet
      end
    end
    matching_tweet
  end

  def add_to_favs(zombie)
    f = Favs.new
    f.zombie = zombie
    @favs.push(f)
  end

end