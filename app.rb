require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @user_name = params[:name]
    "#{@user_name}".reverse
  end

  get '/square/:number' do
    num = params[:number].to_i ** 2
    num.to_s
  end

  get "/say/:number/:phrase" do
    phrase_string = ""
    params[:number].to_i.times do
      phrase_string += params[:phrase] + " "
    end
    phrase_string
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    params.map { |key, value| value}.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    result = nil
    case params[:operation]
      when "add"
        result = num1 + num2
      when "subtract"
        result = num1 - num2
      when "multiply"
        result = num1 * num2
      when "divide"
        result = num1/num2
      else
        result = "That isn't an operation."
    end
      result.to_s
  end

end