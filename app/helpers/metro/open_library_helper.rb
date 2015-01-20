module Metro::OpenLibraryHelper
  def open_library_thumbnail(document, image_options={})
    if document['ol_cover_s']
      t_url = "http://covers.openlibrary.org/b/olid/#{document['ol_s']}-S.jpg"
    #elsif document['librarything_s']
    #  t_url = "http://www.librarything.com/devkey/3f8baa261818a718f42e1c94df68f48b8/small/isbn/#{document['librarything_s']}"
    elsif document['ol_s']
      t_url = "http://covers.openlibrary.org/b/olid/#{document['ol_s']}-S.jpg"
    end
    if t_url
      image_tag t_url, image_options
    end
  end
  def link_to_librarything(document)
    if document['librarything_s']
      t_url = "https://www.librarything.com/work/#{document['librarything_s']}"
      link_to "Library Thing", t_url
    end
  end
  def translate_ol_author(options={})
    value = options[:value]
    if value.is_a? Array
      value.collect {|x| t("openlibrary.#{x}")}
    else
      t("openlibrary.#{value}")
    end
  end
end