class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
	#	:confirmable, #
		:lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]


	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable,
				 :authentication_keys => [:username]


	#usernameを必須とする
	validates_uniqueness_of :username
	validates_presence_of :username

	#usernameを利用してログインするようにオーバーライド
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			#認証の条件式を変更する
			where(conditions).where(["username = :value", { :value => username }]).first
		else
			where(conditions).first
		end
	end

	#登録時にemailを不要とする
	def email_required?
		false
	end

	def email_changed?
		false
	end

	def self.from_omniauth(auth)
		where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.username = auth["info"]["nickname"]
		end
	end

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end
end
