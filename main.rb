require_relative 'loader'

def add(name, phone, email)
  MiniAgenda::Commands::AddContact.new(name: name, phone: phone, email: email).call
rescue => e
  puts "[ADD ERROR] #{e.message}"
end

def remove(name)
  MiniAgenda::Commands::RemoveContact.new(name: name).call
rescue => e
  puts "[REMOVE ERROR] #{e.message}"
end

def find(name)
  contact = MiniAgenda::Queries::FindContact.new(name: name).call
  if contact
    puts "\n🔍 Contacto encontrado:"
    puts MiniAgenda::Formatters::ContactFormatter.to_text(contact)
  else
    puts "[NOT FOUND] #{name}"
  end
end

def list_all
  puts "\n📋 Lista de contactos:"
  puts MiniAgenda::Formatters::ContactFormatter.to_text(
    MiniAgenda::Queries::ListContacts.call
  )
end

def show_json_all
  puts "\n🧾 JSON:"
  puts MiniAgenda::Formatters::ContactFormatter.to_json(
    MiniAgenda::Queries::ListContacts.call
  )
end

# ------------------------------
# 🧪 Batería de datos de prueba
# ------------------------------

puts "🔧 Iniciando prueba de batería...\n"

# Contactos válidos
add("Ana", "111-111-1111", "ana@mail.com")
add("Carlos", "222-222-2222", "carlos@mail.com")
add("Beto", "333-333-3333", "beto@mail.com")

# Duplicado
add("Ana", "444-444-4444", "ana@otro.com") # ➜ Error

# Email inválido
add("MalCorreo", "555-555-5555", "correo_mal_formato") # ➜ Error

# Eliminación y búsqueda
remove("Carlos")
find("Carlos")  # ➜ No encontrado
find("Beto")    # ➜ Debería mostrarse

# Lista final
list_all

# También en JSON
show_json_all
