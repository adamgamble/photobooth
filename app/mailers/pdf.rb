class Pdf < ActionMailer::Base
  default from: "donotreply@candaceandandrew.com"
  def pdf_mailer(email, file_path)
    attachments['photo_session.pdf'] = File.read(file_path)
    mail(to: email, subject: 'Here are your pictures!')
  end
end
