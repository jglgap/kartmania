# ============================================================
# Seeds — Usuarios iniciales del sistema
# Ejecutar con: rails db:seed

# ============================================================


User.destroy_all

# --- Admin ---
User.create!(
  email:    "a23ricardosr@iessanclemente.net",
  password: "abc123",
  nombre:   "admin",
  tipo:     :admin
)

# --- Trabajadores ---
User.create!(
  email:    "ricardosren@gmail.com",
  password: "abc123",
  nombre:   "Ricardo",
  tipo:     :trabajador,
  ciudad:   "A Coruña",
  telefono: "600111222"
)

User.create!(
  email:    "maracuchu16@gmail.com",
  password: "abc1233",
  nombre:   "maracas",
  tipo:     :trabajador,
  ciudad:   "Madrid",
  telefono: "600333444"
)

puts "Usuarios creados: #{User.count}"