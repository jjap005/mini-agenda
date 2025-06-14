require 'minitest/autorun'
require_relative '../lib/gen_server'
require_relative '../commands/add_contact'
require_relative '../commands/remove_contact'
require_relative '../queries/find_contact'
require_relative '../queries/list_contacts'
require_relative '../domains/contacts/contact'
require_relative '../validators/email_validator'
require_relative '../events/event_store'
require_relative '../events/contact_added'
require_relative '../events/contact_removed'