  def upload_photo
    @picture = Picture.create(
                  #パラメーターを設定
               )
picture.save!

    render status: 200, json: @picture, nothing: true
   end