require 'bigdecimal'

@currency = {
    0.01 => 'PENNY', 0.05 => 'NICKEL',
    0.10 => 'DIME', 0.25 => 'QUARTER',
    0.50 => 'HALF DOLLAR', 1.0 => 'ONE',
    2.00 => 'TWO', 5.00 => 'FIVE',
    10.00 => 'TEN', 20.00 => 'TWENTY',
    50.00 => 'FIFTY', 100.00 => 'ONE HUNDRED'
}

@values = @currency.keys.sort.reverse

def max_currency(change)
  @values.each do |val|
    return val if val <= change
  end
end

File.open(ARGV[0]).each_line do |line|
  purchase, paid = line.strip.split(';').map{ |str| BigDecimal.new(str) }
  if paid < purchase
    puts 'ERROR'
  elsif paid == purchase
    puts 'ZERO'
  else
    change = paid - purchase
    result = []
    while change > 0
      max_change = max_currency(change)
      result << @currency[max_change]
      change -= BigDecimal.new(max_change, 2)
    end
    puts result.join(',')
  end
end