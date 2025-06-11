## main.rb

```ruby
  require_relative 'app/loader'
```

## Helper para crear contactos fácilmente

```ruby
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
```

## 🧪 Batería de datos de prueba

## ------------- ruby main.rb --------------

```ruby
  puts "\n🚀 Cargando datos de prueba..."

  add("Ana", "111-111-1111", "ana@mail.com")
  add("Carlos", "222-222-2222", "carlos@mail.com")
  add("Beto", "333-333-3333", "beto@mail.com")
  add("Ana", "444-444-4444", "ana@otro.com") # Duplicado, error
  add("MalCorreo", "555-555-5555", "invalidoemail") # Email inválido

  puts "\n❌ Intentos de eliminación y búsqueda:"
  remove("Carlos")
  find("Carlos")
  find("Ana")

  puts "\n📋 Resultado final:"
  list_all
```

## 🧪 Ejecutar test

## ------------------ TESTS ------------------

```ruby
    ruby -Itest test/* (todos los tests)
    ruby -Itest test/[name_test.rb] (test especifico)
```

## Estructura de carpetas usando CQRS

```ruby
    MiniAgenda/
    ├── loader.rb
    ├── main.rb
    ├── lib/
    │   └── gen_server.rb
    ├── commands/
    │   ├── add_contact.rb
    │   └── remove_contact.rb
    ├── queries/
    │   ├── find_contact.rb
    │   └── list_contacts.rb
    ├── domains/
    │   └── contacts/
    │       └── contact.rb
    ├── validators/
    │   └── email_validator.rb
    ├── presenters/
    │   └── contact_presenter.rb
    ├── formatters/
    │   └── contact_formatter.rb
    ├── test/
```