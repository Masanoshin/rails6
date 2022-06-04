module ApplicationHelper

  def document_title
    if @title.present?  #presentメソッドはblank?メソッドの否定である
      "#{@title} - baukis2"
    else
      "bukis2"
    end
  end
end
