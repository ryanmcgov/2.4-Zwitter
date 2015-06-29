require 'tweet.rb'

class Zombie
  attr_accessor :name, :username, :password, :image, :location, :bio, :tweets, :created_at

  def initialize
    self.name = 'uuuuuhhhhhhhh'
    self.username = 'uuuuuuuuuuuhhh'
    self.password = 'Uuuuuuuhh'
    self.image = 
    self.location = 'uuuh'
    self.bio = 'uuuuuuuhhhh uuuuuhhhh uuuuuuuuuuuuuuuhhhhhh. Uuuuuuuuhhhhhhhhhhh uuuhh uuhhh'
    self.tweets = []
  end

  def create_tweet(content:, location:)
    t = Tweet.new
    t.zombie = self
    t.content = content
    t.location = location
    self.tweets.push(t)
    # Returns the tweet
    t
  end

  def delete_tweet(tweet_id)
    tweet = return_tweet(tweet_id)
    if tweet
      if tweet.original_tweet
        tweet.original_tweet.retweets -= 1
      end
    end
    @tweets.delete_if { | tweet | tweet.unique_id == tweet_id }
  end

  def return_tweet(tweet_id)
    return_tweet = nil
    @tweets.each { | tweet | return_tweet = tweet if tweet.unique_id == tweet_id }
    return_tweet
  end

  def add_fav(tweet_id)
    tweet = Tweet.find_tweet(tweet_id)
    tweet.add_to_favs(self)
  end

  def delete_fav(tweet_id)
    tweet = Tweet.find_tweet(tweet_id)
    tweet.favs.delete_if do | fav |
      fav.zombie.username == @username
    end
  end

end