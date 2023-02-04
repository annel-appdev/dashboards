class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    #params are
    #Parameters: {"from_currency"=>"AED"}

    @from_symbol = params.fetch("from_currency")

    render({ :template => "currency_templates/step_two.html.erb" })
  end

  def third_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    #params are
    #Parameters: {"from_x"=>"USD", "to_y"=>"EUR"}

    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")

    @exchange_rate_data = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}").read
    @exchange_rate_parsed = JSON.parse(@exchange_rate_data)
    @conversion_hash = @exchange_rate_parsed.fetch("info")
    @conversion_rate = @conversion_hash.fetch("rate")

    render({ :template => "currency_templates/step_three.html.erb" })
  end
end
