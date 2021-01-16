# Preview all emails at http://localhost:3000/rails/mailers/draft_articles_mailer
class DraftArticlesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/draft_articles_mailer/no_author
  def created
    DraftArticlesMailer.created('test@example.com', Article.first)
  end
  
  def no_author
    DraftArticlesMailer.no_author('test@example.com')
  end

end
