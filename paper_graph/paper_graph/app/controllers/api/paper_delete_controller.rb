  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    respond_to do |format|
      format.html
      format.json { render :json =>  true }
    end
  end