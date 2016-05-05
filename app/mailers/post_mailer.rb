class PostMailer < ApplicationMailer

  def post_email(user, mythread)
    @title = mythread.title
    mail to: user.email, subject: "Post thread"
  end
end
