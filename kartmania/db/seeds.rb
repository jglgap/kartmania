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
  tipo:     :admin,
  telefono: "600111222"
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


Provincia.destroy_all

Provincia.create!(nombre: "Araba/Álava")              
Provincia.create!(nombre: "Albacete")                 
Provincia.create!(nombre: "Alicante/Alacant")         
Provincia.create!(nombre: "Almería")                  
Provincia.create!(nombre: "Ávila")                    
Provincia.create!(nombre: "Badajoz")                  
Provincia.create!(nombre: "Balears, Illes")           
Provincia.create!(nombre: "Barcelona")                
Provincia.create!(nombre: "Burgos")                   
Provincia.create!(nombre: "Cáceres")                   
Provincia.create!(nombre: "Cádiz")                     
Provincia.create!(nombre: "Castellón/Castelló")        
Provincia.create!(nombre: "Ciudad Real")               
Provincia.create!(nombre: "Córdoba")                   
Provincia.create!(nombre: "Coruña, A")                 
Provincia.create!(nombre: "Cuenca")                    
Provincia.create!(nombre: "Girona")                    
Provincia.create!(nombre: "Granada")                   
Provincia.create!(nombre: "Guadalajara")               
Provincia.create!(nombre: "Gipuzkoa")                  
Provincia.create!(nombre: "Huelva")                    
Provincia.create!(nombre: "Huesca")                    
Provincia.create!(nombre: "Jaén")                      
Provincia.create!(nombre: "León")                      
Provincia.create!(nombre: "Lleida")                    
Provincia.create!(nombre: "Rioja, La")                 
Provincia.create!(nombre: "Lugo")                      
Provincia.create!(nombre: "Madrid")                    
Provincia.create!(nombre: "Málaga")                    
Provincia.create!(nombre: "Murcia")                    
Provincia.create!(nombre: "Navarra")                   
Provincia.create!(nombre: "Ourense")                   
Provincia.create!(nombre: "Asturias")                  
Provincia.create!(nombre: "Palencia")                  
Provincia.create!(nombre: "Palmas, Las")               
Provincia.create!(nombre: "Pontevedra")                
Provincia.create!(nombre: "Salamanca")                 
Provincia.create!(nombre: "Santa Cruz de Tenerife")    
Provincia.create!(nombre: "Cantabria")                 
Provincia.create!(nombre: "Segovia")                   
Provincia.create!(nombre: "Sevilla")                   
Provincia.create!(nombre: "Soria")                     
Provincia.create!(nombre: "Tarragona")                 
Provincia.create!(nombre: "Teruel")                    
Provincia.create!(nombre: "Toledo")                    
Provincia.create!(nombre: "Valencia/València")         
Provincia.create!(nombre: "Valladolid")                
Provincia.create!(nombre: "Bizkaia")                   
Provincia.create!(nombre: "Zamora")                    
Provincia.create!(nombre: "Melilla")                   
Provincia.create!(nombre: "Zaragoza")                  
Provincia.create!(nombre: "Ceuta")                     



