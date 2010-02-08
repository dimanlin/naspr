class ContentsController < ApplicationController

  before_filter :contents

  layout "main"

  def show
    @content = Content.find_by_urlname(params[:urlname])
  end

end

