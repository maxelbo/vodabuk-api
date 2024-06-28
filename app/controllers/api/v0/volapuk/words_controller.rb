class Api::V0::Volapuk::WordsController < ApplicationController
  def index
    @words = Word.includes(:translations, :examples).where(lang: 'volapuk')
    render json: @words
  end

  # GET /words/1
  def show
    render json: @word
  end

  def new
    @word = Word.new
    @word.translations.build
    @word.examples.build
  end
  
  # POST /words
  def create
    @word = Word.new(word_params.merge(lang: 'volapuk'))
    if @word.save
      redirect_to api_v0_volapuk_word_path(@word)
    else
      render :new
    end
  end

  # PATCH/PUT /words/1
  def update 
    if @word.update(word_params)
      render json: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # DELETE /words/1
  def destroy
    @word.destroy!
  end

  # GET /words/by_root/1
  def by_root
    @words = Word.where("roots LIKE ?", "%#{params[:root]}%").where(lang: 'volapuk')
    render json: @words
  end

  # GET /words/by_letter/1
  def by_letter
    @words = Word.where("letter LIKE ?", "%#{params[:letter]}%").where(lang: 'volapuk')
    render json: @words
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(
      :lang, :word, roots: [], :letter, :category,
      translations_attributes: [:id, :lang, :text, :_destroy],
      examples_attributes: [:id, :lang, :text, :_destroy],
    )
  end
end
