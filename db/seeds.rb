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
  Subject.find_or_create_by!(
    name: subject['name']
  )
end

# Seed Agents
agents_data['results'].each do |agent|
  new_agent = Agent.find_or_create_by!(
    name: agent['person']['name']
  )

  # Seed Books and Resources
  books_data['results'].each do |book|
    new_book = Book.find_or_create_by!(
      title: book['title'],
      downloads: book['downloads']
    )

    # Seed Resources
    book['resources'].each do |resource|
      Resource.find_or_create_by!(
        book: new_book,
        uri: resource['uri'],
        resource_type: resource['type']
      )
    end

    # Seed Book-Agent Associations
    book['agents'].each do |book_agent|
      if book_agent['id'] == agent['id']
        new_agent.books << new_book unless new_agent.books.include?(new_book)
      end
    end

    # Seed Book-Subject Associations
    book['subjects'].each do |book_subject|
      subject = Subject.find_by(name: book_subject)
      new_book.subjects << subject unless new_book.subjects.include?(subject)
    end
  end
end

AdminUser.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end if Rails.env.development?
