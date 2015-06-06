class LiteratureController < ApplicationController
  def gost
    if signed_in?
      @literature = current_user.list_elements.build
    end
    if(cookies[:count].nil?)
      cookies[:count] = 0
    end
    count = cookies[:count]
    case params[:commit]
      when "Добавить НПД"
        cookies[count] = npd
      when "Добавить НТД"
        cookies[count] = ntd
      when "Добавить книгу"
        cookies[count] = one_book
      when "Добавить тома"
        cookies[count] = more_book
      when "Добавить диссертацию"
        cookies[count] = disert
      when "Добавить Эл. носитель"
        cookies[count] = disc
      when "Добавить сайт"
        cookies[count] = site
      when "Добавить часть документа"
        cookies[count] = doc_part
      when "Добавить статью"
        cookies[count] = stat
      when "Добавить статью из газеты"
        cookies[count] = stat_news
      when "Добавить статью из журнала"
        cookies[count] = stat_jour
      when "Очистить"
        clear
      
    end
    count = cookies[:count]
    @lit_list = ""
    i = 0
    while i < count.to_i do
      @lit_list += (i+1).to_s+"." + cookies[i] + "\n"
      i+=1
    end
      
    if(signed_in?)
      @literature.literature = @lit_list
    end
  end
  def clear
    count = cookies[:count]
    i = 0
    while i < count.to_i do
      cookies[i].destroy
      i+=1
    end
    count = 0
  end
end
