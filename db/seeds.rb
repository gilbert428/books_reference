# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'

# URLs for the APIs
agent_url = "https://gnikdroy.pythonanywhere.com/api/agent/"
book_url = "https://gnikdroy.pythonanywhere.com/api/book/"
subject_url = "https://gnikdroy.pythonanywhere.com/api/subject/"

# Fetch and parse JSON data from the APIs
agents_data = JSON.parse(URI.open(agent_url).read)
books_data = JSON.parse(URI.open(book_url).read)
subjects_data = JSON.parse(URI.open(subject_url).read)


# Seed Subjects

  subjects_data['results'].each do |subject|
    next if subjects_data['next'].nil?
    Subject.find_or_create_by!(
      subject_id: subject['id'],
      name: subject['name']
    )
  end



# Seed Agents
agents_data['results'].each do |agent|
  next if agent['id'].nil?

  new_agent = Agent.find_or_create_by!(
    agent_id: agent['id'],
    name: agent['person']['name'],
    alias: agent['person']['alias'],
    birth_date: agent['person']['birth_date'],
    webpage: agent['person']['webpage']
  )

  if new_agent.persisted?
    # Seed Books and Resources
    books_data['results'].each do |book|
      new_book = Book.find_or_create_by!(
        book_id: book['id'],
        title: book['title'],
        description: book['description'],
        downloads: book['downloads'],
        license: book['license']
      )

      # Seed Resources
      book['resources'].each do |resource|
        Resource.find_or_create_by!(
          resource_id: resource['id'],
          book: new_book,
          uri: resource['uri'],
          resource_type: resource['type']
        )
      end

      # Seed Book-Agent Associations
      book['agents'].each do |agent|
        if agent['id'] == new_agent.agent_id
          AgentsBook.find_or_create_by!(
            agent: new_agent,
            book: new_book
          )
        end
      end

      # Seed Book-Subject Associations
      book['subjects'].each do |subject|
        subject_record = Subject.find_by(name: subject)
        if subject_record
          BooksSubject.find_or_create_by!(
            book: new_book,
            subject: subject_record
          )
        else
          puts "Subject #{subject} not found"
        end
      end

    end
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?