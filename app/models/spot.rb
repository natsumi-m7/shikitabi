class Spot < ApplicationRecord
	has_many :favorites,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_many :went_spots,dependent: :destroy
    # carrierWaveを使う為の記述
	mount_uploader :images, ImagesUploader
    # geocorderでアドレスから緯度経度を取得する為の記述
    geocoded_by :spot_address
    after_validation :geocode

        # DBには数値が保存されていて、表示される時だけ対応した文字列になる。
    	enum season: {
        '春':1,
        '夏':2,
        '秋':3,
        '冬':4,
    }
    	enum prefecture: {
        '東京':1,
        '神奈川':2,
        '埼玉':3,
        '千葉':4,
        '群馬':5,
        '栃木':6,
        '茨城':7,
    }
end
