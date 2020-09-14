class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）
  with_options presence: true do
    validates :nickname
    # メールアドレスは@を含む必要があること
    validates :email, uniqueness: true, format: { with: /[^\s]+@[^\s]/}
    # パスワードは6文字以上であること, 半角英数字混合であること, 確認用を含めて2回入力すること
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/}
    # ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    # ユーザー本名のフリガナは全角（カタカナ）で入力させること
    validates :first_name_leading, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_leading, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end