require "openai"

user_input = ""

while user_input != "bye"
  puts "Hello! How can I help you today"
  
  line_width = 50
  puts "-" * line_width

  user_input = gets.chomp
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant."
  },
  {
    "role" => "user",
    "content" => user_input
  }
]

api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

new_message = api_response.fetch("choices").at(0).fetch("message")
pp new_message
puts "-" * line_width
end

=begin
message_list.push(new_message)
message_list.push(
  {:role => "user", :content => "What about NYC?"}
)

pp new_message
puts "-" * line_width
end

  
rescue => exception
  
end
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

new_message = api_response.fetch("choices").at(0).fetch("message")

message_list.push(new_message)

pp new_message
=end
