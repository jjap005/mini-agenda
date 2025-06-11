# app/loader.rb

require 'singleton'
require 'json'

# Libs
require_relative 'lib/gen_server'

# Domain
require_relative 'domains/contacts/contact'

# Validators
require_relative 'validators/email_validator'

# Commands
require_relative 'commands/add_contact'
require_relative 'commands/remove_contact'

# Queries
require_relative 'queries/find_contact'
require_relative 'queries/list_contacts'

# Presentation
require_relative 'presenters/contact_presenter'
require_relative 'formatters/contact_formatter'
