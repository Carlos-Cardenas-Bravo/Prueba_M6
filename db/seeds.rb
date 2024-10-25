

admin = User.create!(
  name: 'Esteban',
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  role: :admin
)

puts "Administrador creado: #{admin.email}"
