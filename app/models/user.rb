class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable, :confirmable, :async

  has_many :predictions
  belongs_to :group

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end
    end
  end

  def self.add_double_credits_to_users
    User.all.each { |user| user.add_double_credit_up_to_limit }
  end

  def prediction_for(match)
    predictions.find_by(match: match)
  end
  alias_method :has_predicted?, :prediction_for

  def match_predictions
    weeks_predictions = Match.all.map do |match|
      if has_predicted?(match) && !match.match_started?
        prediction_for(match)
      elsif !has_predicted?(match) && !match.match_started?
        Prediction.new(match: match, user: self)
      end
    end
    return weeks_predictions.compact
  end
  
  def past_predictions
    past_predictions = Match.all.map do |match|
      prediction_for(match) if has_predicted?(match) && match.match_finished?
    end
    return past_predictions.compact
  end
  
  def self.assign_points_to_all_users
    User.all.each { |user| user.user_points }
  end

  def user_points
    self.total_points = predictions.where(user: self).this_season.sum(:points)
    save
  end

  def add_double_credit_up_to_limit
    add_one_double_credit if self.credits_received < 38
    save
  end

  def refund_credit
    add_each_double_credit
    save
  end

  def has_no_credits?
    self.double_credits <= 0
  end

  def use_double_credit
    self.double_credits -= 1 if self.double_credits >= 1
    save
  end

  def add_one_double_credit
    add_each_double_credit
    count_each_credit_recieved
  end

  def add_each_double_credit
    self.double_credits += 1
  end

  def count_each_credit_recieved
    self.credits_received += 1
  end

end
