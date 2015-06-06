module LiteratureHelper
  def stat_jour
    if(params[:autor].blank? || params[:title].blank? || params[:title_place].blank? || params[:title_jour].blank? ||params[:number].blank?||params[:number].blank? ||params[:year].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    autor = params[:autor]
    arr_autors = autor.split(',')
    count_autors = arr_autors.count
    formed_autors = ""
    arr_autors.from(1).to(4).each do |t|
      if(t != arr_autors.last)
        formed_autors += form(t,false) + ", "
      else
        formed_autors += form(t,false)
      end
    end
    title = params[:title]
    title_info = params[:title_info]
    title_place = params[:title_place]
    title_jour = params[:title_jour]
    year = params[:year]
    number = params[:number]
    list_elements = form(arr_autors[0],true) +"."+title+ "[Текст]"
    if(!title_info.blank?)
      list_elements += ":"+title_info
    end
    list_elements +="/"
    if(count_autors == 1)
      list_elements += form(arr_autors[0],false)
    elsif(count_autors == 2..4)
      list_elements += formed_autors
    elsif(count_autors == 5)
      list_elements += formed_autors+" и др."
    end
    list_elements += "//" + title_jour + ".- " + year + ".- " + number + ".- " + title_place + "c."
    
  end
  
  def stat_news
    if(params[:autor].blank? || params[:title].blank? || params[:title_place].blank? || params[:title_news].blank? ||params[:number].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    autor = params[:autor]
    arr_autors = autors.split(',')
    count_autors = arr_autors.count
    formed_autors = ""
    arr_autors.from(1).to(4).each do |t|
      if(t != arr_autors.last)
        formed_autors += form(t,false) + ", "
      else
        formed_autors += form(t,false)
      end
    end
    title = params[:title]
    title_info = params[:title_info]
    number = params[:number]
    title_news = params[:title_news]
    title_place = params[:title_place]
    
    list_elements = form(arr_autors[0],true) +"."+title+ "[Текст]"
    if(!title_info.blank?)
      list_elements += ":"+title_info
    end
    list_elements +="/"
    if(count_autors == 1)
      list_elements += form(arr_autors[0],false)
    elsif(count_autors == 2..4)
      list_elements += formed_autors
    elsif(count_autors == 5)
      list_elements += formed_autors+" и др."
    end
    list_elements +="//"+title_news + ".- " + number + ".- " + title_place + "c."
  end
  
  def stat
    if(params[:autors].blank? || params[:title].blank? || params[:autors_book].blank? || params[:redactors_book].blank? ||params[:edition_place].blank?||params[:edition].blank?||params[:edition_year].blank?||params[:str].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    autors = params[:autors]
    arr_autors = autors.split(',')
    count_autors = arr_autors.count
    formed_autors = ""
    arr_autors.from(1).to(4).each do |t|
      if(t != arr_autors.last)
        formed_autors += form(t,false) + ", "
      else
        formed_autors += form(t,false)
      end
    end
    title_info = params[:title_info]
    title = params[:title]
    title_book = params[:title_book]
    title_book_info = params[:title_book_info]
    str = params[:str]
    
    autors_book = params[:autors_book]
    arr_autors_book = autors_book.split(',')
    count_autors_book = arr_autors_book.count
    formed_autors_book = ""
    arr_autors_book.from(1).to(4).each do |t|
      if(t != arr_autors_book.last)
        formed_autors_book += form(t,false) + ", "
      else
        formed_autors_book += form(t,false)
      end
    end
    
    redactors_book = params[:redactors_book]
    arr_redactors_book = redactors_book.split(',')
    count_redactors_book = arr_redactors_book.count
    formed_redactors_book = ""
    arr_redactors_book.from(1).to(4).each do |t|
      if(t != arr_redactors_book.last)
        formed_redactors_book += form(t,false) + ", "
      else
        formed_redactors_book += form(t,false)
      end
    end
    edition_place = params[:edition_place]
    edition = params[:edition]
    edition_year = params[:edition_year]
    
    #Формируем элемент списка
    list_elements = form(arr_autors[0],true) +"."+title+ "[Текст]"
    if(!title_info.blank?)
      list_elements += ":"+title_info
    end
    list_elements +="/"
    if(count_autors == 1)
      list_elements += form(arr_autors[0],false)
    elsif(count_autors == 2..4)
      list_elements += formed_autors
    elsif(count_autors == 5)
      list_elements += formed_autors+" и др."
    end
    list_elements +="//"+title_book
    if(!title_book_info.blank?)
      list_elements += ":"+ title_book_info
    end
    
    #Добавляем элементы связаные с книгой
    if(count_autors != 0)
      list_elements += "/"
      if(count_autors == 1)
        list_elements += form(arr_autors[0],false)
      elsif(count_autors == 2..4)
        list_elements += formed_autors
      elsif(count_autors == 5)
        list_elements += formed_autors+" и др."
      end
      if(count_redactors_book != 0)
        list_elements +=";"+formed_redactors_book
      end
    end
    list_elements += ".- " + edition_place + ":" + edition+ ", " + edition_year + ".- " + str + "стр."
  end
  
  def doc_part
    if(params[:title_info].blank? || params[:title_source].blank? || params[:title_place].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    title_info = params[:title_info]
    title_source = params[:title_source]
    title_place = params[:title_place]
    lit_list = title_info +"//"+title_source+".- " + title_place + "."
  end
  
  def site
    autor = params[:autor]
    title_info = params[:title_info]
    group = params[:group]
    arr_group = group.split(',')
    count_group = arr_group.count
    formed_group = ""
    arr_group.from(1).to(4).each do |t|
      if(t != arr_group.last)
        formed_group += form(t,false) + ", "
      else
        formed_group += form(t,false)
      end
    end
    edition_place = params[:edition_place]
    edition = params[:edition]
    year_editon = params[:year_editon]
    url = params[:url]
    lit_list = form(autor,false) + "." + "[Электронный ресурс]"
    if(!title_info.blank?)
      lit_list += ": " + title_info
    end
    lit_list += "/" + form(autor,true)
    if(!group.blank?)
      lit_list += ";"+ formed_group
    end
    lit_list += ". – «электрон. текст. дан. - " + edition_place + ":" + edition + "," + year_edition + ".- " + "Режим доступа:" + url
  end
  
  def disc
    if(params[:autor].blank? || params[:group].blank? || params[:series].blank? || params[:year_editon].blank? ||params[:edition_place].blank?||params[:edition].blank?||params[:volume].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    autor = params[:autor]
    title_info = params[:title_info]
    type_resource = params[:type_resource]
    resource
    if(type_resource == 1)
      resource = 'электрон. дан.'
    else
      resource = 'электрон. прогр.'
    end
    group = params[:group]
    arr_group = group.split(',')
    count_group = arr_group.count
    formed_group = ""
    arr_group.from(1).to(4).each do |t|
      if(t != arr_group.last)
        formed_group += form(t,false) + ", "
      else
        formed_group += form(t,false)
      end
    end
    series = params[:series]
    edition_place = params[:edition_place]
    edition = params[:edition]
    year_editon = params[:year_editon]
    type_disc = [:type_disc]
    disc
    if(type_disc == 1)
      disc = "CD"
    else
      disc = "DVD"
    end
    volume = params[:volume]
    lit_list = form(autor,false) + "." + "[Электронный ресурс]"
    if(!title_info.blank?)
      lit_list += ": " + title_info
    end
    lit_list += "/" + form(autor,true)
    if(!group.blank?)
      lit_list += ";"+ formed_group
    end
    lit_list += ".- " + resource + ".- " + edition_place + ":" + edition + ", " + year_edition + ".- " + volume + " эл. опт. диск" +"("+disc + "-ROM)."
    if(!series.blank?)
      lit_list += "- ("+series+")."
    end
    lit_list
  end
  
  def disert
    if(params[:autor].blank? || params[:title].blank? || params[:special_number].blank? || params[:group].blank? ||params[:writing_place].blank?||params[:volume].blank?||params[:date_protection].blank?||params[:date_approv].blank?||params[:date_writing].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    autor = params[:autor]
    title = params[:title]
    title_info = params[:title_info]
    special_number = params[:special_number]
    group = params[:group]
    arr_group = group.split(',')
    count_group = arr_group.count
    
    formed_group = ""
    arr_group.from(1).to(4).each do |t|
      if(t != arr_group.last)
        formed_group += form(t,false) + ", "
      else
        formed_group += form(t,false)
      end
    end
    writing_place = params[:writing_place]
    volume = params[:volume]
    date_prot = params[:date_protection]
    date_appr = params[:date_approv]
    date_writ = params[:date_writing]
    lit_list = form(autor,false) + "." + title + "[Текст]"
    if(!title_info.blank?)
      lit_list += ": " + title_info
    end
    lit_list += ": " + special_number + "дис. ..... канд. наук" + ": защищена" + date_prot + ": утв." + date_appr +"/"+form(autor,true)
    if(!group.blank?)
      lit_list += ";" + formed_group
    end
    lit_list += ".- " + writing_place +", "+ date_writ + ".- " + volume + "c."
  end
  
  
  
  def ntd
    if(params[:doc_name].blank? || params[:title_info].blank? || params[:last_doc].blank? || params[:year].blank? ||params[:date_adm].blank?||params[:volume].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    doc_name = params[:doc_name]
    title_info = params[:title_info]
    last_doc = params[:last_doc]
    year = params[:year]
    date_adm = params[:date_adm]
    volume = params[:volume]
    list_element = doc_name+"[Текст]"+": " +title_info+", " + last_doc+", " +date_adm+". – " +year + ". – "+volume+"."
  end
  
  def npd
    if(params[:doc_name].blank? || params[:title_info].blank? || params[:name].blank? || params[:year].blank? ||params[:date_adm].blank?||params[:volume].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    doc_name = params[:doc_name]
    title_info = params[:title_info]
    date_adm = params[:date_adm]
    name = params[:name]
    year = params[:year]
    number = params[:number]
    date_newspaper = params[:date_newspaper]
    info = String.new
    if(number.blank?)
      info = date_newspaper
    elsif (!number.blank? && !date_newspaper.blank?)
      info = "№ "+number + ", " + date_newspaper
    else
      info = "№ "+number
    end
    pages = params[:pages]
    list_element = doc_name+"[Текст]"+": "+title_info+', '+"от "+date_adm+ " // "+name+". - " + year + ". - "+ info+ ". - " + pages + "."
  end
  def more_book
    if(params[:autors].blank? || params[:title_info].blank?|| params[:title].blank? || params[:redactors].blank? || params[:tom_count].blank? ||params[:edition_place].blank?||params[:edition].blank?||params[:date_edition_start].blank?||params[:date_edition_end].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    autors = params[:autors]
    title = params[:title]
    title_info = params[:title_info]
    redactors = params[:redactors]
    tom_count = params[:tom_count]
    edition_place = params[:edition_place]
    edition = params[:edition]
    date_ed_start = params[:date_edition_start]
    date_ed_end = params[:date_edition_end]
    series = params[:series]
    #формируем авторов
    arr_autors = autors.split(',')
    count_autors = arr_autors.count
    formed_autors = ""
    arr_autors.from(1).to(4).each do |t|
      if(t != arr_autors.last)
        formed_autors += form(t,false) + ", "
      else
        formed_autors += form(t,false)
      end
    end
    #формируем редакторов
    arr_redactors = redactors.split(',')
    count_redactors = arr_redactors.count
    formed_redactors = ""
    arr_redactors.each do |t|
      if(t != arr_redactors.last)
        formed_redactors += form(t,false) + ", "
      else
        formed_redactors += form(t,false)
      end
    end
    #Формируем элемент списка
    if(count_autors == 0)
      list_elements = title + "[Текст]"
      if(count_redactors != 0)
        list_elements += "/"+ formed_redactors
      end
      
    else
      list_elements = form(arr_autors[0],true) +"."+title+ "[Текст]"+":"+title_info+"/"
      if(count_autors == 1)
        list_elements += form(arr_autors[0],false)
      elsif(count_autors == 2..4)
        list_elements += formed_autors
      elsif(count_autors == 5)
        list_elements += formed_autors+" и др."
      end
      if(count_redactors != 0)
        list_elements +=";"+formed_redactors
      end
    end
    list_elements += edition_place + ":" + edition + "," + date_ed_start+" - "+date_ed_end +".- "+tom_count+ " т."
    if(!series.blank?)
      list_elements += ".- "+"("+series+")"
    end
  end
  
  def one_book
    if(params[:autors].blank? || params[:title_info].blank?|| params[:title].blank? || params[:redactors].blank? ||params[:edition_place].blank?||params[:edition].blank?||params[:date_edition].blank?||params[:volume].blank?)
      flash[:error] = "Введены пустые поля"
      return
    end
    cookies[:count] = cookies[:count].to_i + 1
    
    list_element = String.new
    autors = params[:autors]
    arr_autors = autors.split(',')
    count_autors = arr_autors.count
    
    formed_autors = ""
    arr_autors.from(1).to(4).each do |t|
      if(t != arr_autors.last)
        formed_autors += form(t,false) + ", "
      else
        formed_autors += form(t,false)
      end
    end
    
    title = params[:title]
    title_info = params[:title_info]
    
    redactors = params[:redactors]
    arr_redactors = redactors.split(',')
    count_redactors = arr_redactors.count
    
    formed_redactors = ""
    arr_redactors.each do |t|
      if(t != arr_redactors.last)
        formed_redactors += form(t,false) + ", "
      else
        formed_redactors += form(t,false)
      end
    end
    
    edition_info = params[:edition_info]
    edition_place = params[:edition_place]
    edition = params[:edition]
    date_edition = params[:date_edition]
    volume = params[:volume]
    series = params[:series]
    if(count_autors == 0)
      list_elements = title + "[Текст]"
      if(count_redactors != 0)
        list_elements += "/"+ formed_redactors
      end
      
    else
      list_elements = form(arr_autors[0],true) +"."+title+ "[Текст]"+":"+title_info+"/"
      if(count_autors == 1)
        list_elements += form(arr_autors[0],false)
      elsif(count_autors == 2..4)
        list_elements += formed_autors
      elsif(count_autors == 5)
        list_elements += formed_autors+" и др."
      end
      if(count_redactors != 0)
        list_elements +=";"+formed_redactors
      end
    end
    if(!edition_info.blank?)
      list_elements += edition_info+".- "
    end
    list_elements += edition_place + ":" +edition + "," + date_edition +".- "+volume + " С."
    if(!series.blank?)
      list_elements += ".- "+"("+series+")"
    end
  end
  
  
  def form(fio,inverse)
    arr_f = fio.split(/[^а-яА-Я0-9_]/)
    if(inverse)
      formed_fio = arr_f[0] +", "+ arr_f[1].first.upcase + "." +arr_f[2].first.upcase + "."
    else
      formed_fio = arr_f[1].first.upcase + "." +arr_f[2].first.upcase + ". " + arr_f[0]
    end
  end
end
