def file_attachment(filename)
  File.new(File.join(RAILS_ROOT, "db", "fixtures", "files", filename), 'rb')
end

password = "Qlgf253u"

User.seed(:email) do |c|
  c.name = "Crush + Lovely"
  c.email = "admin@crushlovely.com"
  c.password = password
  c.password_confirmation = password
end

password = "13kv@rch13"

User.seed(:email) do |c|
  c.name = 'Charles Garcia'
  c.email = 'CGarcia@kvarch.net'
  c.password = password
  c.password_confirmation = password
end

