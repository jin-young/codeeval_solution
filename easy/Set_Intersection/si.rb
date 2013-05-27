File.open(ARGV[0]).each_line do |line|
  arr1, arr2 = line.strip.split(';').map do |str|
    str.split(',').map(&:to_i)
  end

  idx1 = 0
  idx2 = 0
  result = []
  while idx1 < arr1.length and idx2 < arr2.length
    if arr1[idx1] == arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
      idx2 += 1
    else
      if arr1[idx1] > arr2[idx2]
        idx2 += 1
      else
        idx1 += 1
      end
    end
  end

  puts result.join(',')
end