class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_comment.subject
  #
  def new_comment(comment)
    @greeting = "hey there!"
    @id = comment.id
    @commenter = comment.user.name

    mail to: comment.post.user.email
  end
end
