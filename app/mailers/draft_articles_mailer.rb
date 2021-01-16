class DraftArticlesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.draft_articles_mailer.no_author.subject
  #
  def created(to, article)
    @article = article
    mail to: to, subject: 'Your Draft Article has been created.'
  end
  
  def no_author
    mail to: to, subject: "Your email could not be processed" do |format|
      content = 'Please check your draft articles email address and try again.'
      format.html{ render plain: content}
      format.text{ render plain: content}
    end
  end
end
