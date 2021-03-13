module FormHelper
  def error_message_for(form, key)
    if form.object.errors.messages[key].any?
      form.object.errors.messages[key].to_sentence
    else
      ""
    end
  end
end
