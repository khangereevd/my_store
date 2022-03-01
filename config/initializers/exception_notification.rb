if Rails.env == "production" || Rails.env == "staging" || Rails.env == 'development'
  # Исключение отпрвления ошибок на почту
  exceptions = []
  exceptions << 'ActiveRecord::RecordNotFound' # Errors 404
  exceptions << 'AbstractController::ActionNotFound' # Если пользователь набрал не правильный url в адресной строке
  exceptions << 'ActionController::RoutingError' #
  exceptions << 'ActionController::InvalidAuthenticityToken' #

  server_name = case Rails.env
                when "production"     then "mystore.com" # Начало строки об ошибки
                when "staging"        then "staging.mystore.com" # Начало строки об ошибки
                when "development"    then "DEVELOPMENT mystore" # Начало строки об ошибки
                else
                  "unknown env mystore"
                end

  MyStore::Application.config.middleware.use ExceptionNotification::Rack,
                                             email: {
                                               email_prefix:   "[#{server_name} error] ", # Начало строки об ошибки
                                               sender_address: ENV['SMTP_LOGIN'], # От кого
                                               exception_recipients: ["djamal.xangereev@mail.ru"] # К кому, ["djamal.xangereev@mail.ru", "*************@mail.ru"]
                                             },
                                             ignore_exceptions: exceptions # Исключение которые мы добавили в exceptions

end