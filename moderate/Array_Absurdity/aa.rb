def swap_two_elements(arr, idx1, idx2)
  arr[idx1] = arr[idx2] ^ arr[idx1]
  arr[idx2] = arr[idx1] ^ arr[idx2]
  arr[idx1] = arr[idx2] ^ arr[idx1]
end

def merge_sort(arr)
  if arr.length == 1
    arr
  elsif arr.length == 2
    if arr.first > arr.last
      swap_two_elements(arr, 0, 1)
    end
    arr
  else
    center_idx = arr.length / 2
    arr1 = merge_sort(arr[0...center_idx])
    arr2 = merge_sort(arr[center_idx..-1])

    result_arr = []
    p1, p2 = 0, 0
    while p1 < arr1.length and p2 < arr2.length
      if arr1[p1] < arr2[p2]
        result_arr << arr1[p1]
        p1 += 1
      else
        result_arr << arr2[p2]
        p2 += 1
      end
    end

    p1.upto(arr1.length - 1) { |v| result_arr << arr[v] }
    p2.upto(arr2.length - 1) { |v| result_arr << arr[v] }

    result_arr
  end
end

def heap_sort(arr)
  heapify(arr)

  end_idx = arr.length - 1
  while end_idx > 0
    swap_two_elements(arr, 0, end_idx)
    end_idx -= 1
    sift_down(arr, 0, end_idx)
  end
end

def heapify(arr)
  start_idx = (arr.length - 1)/2

  while start_idx >= 0
    sift_down(arr, start_idx, arr.length - 1)
    start_idx -= 1
  end
end

def sift_down(arr, s_idx, e_idx)
  root = s_idx
  while (root * 2 + 1) <= e_idx
    child = root * 2 + 1
    swap = root

    swap = child if arr[swap] < arr[child]

    if child+1 <= e_idx and arr[swap] < arr[child+1]
      swap = child + 1
    end

    if swap != root
      swap_two_elements(arr, root, swap)
      root = swap
    else
      return
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  next if line.strip.length == 0

  str1, str2 = line.strip.split(';')
  n = str1.to_i
  arr = str2.split(',').map(&:to_i)

  dup = nil

  # if we can use hash or map
  #map = {}
  #arr.each do |val|
  #  if map[val]
  #    dup = val
  #    break
  #  else
  #    map[val]=true
  #  end
  #end

  # if we cannot use hash or map,
  # however an ordinary merge sort requires additional space
  #result = merge_sort(arr)
  #0.upto(result.length - 2) do |idx|
  #  if result[idx] == result[idx+1]
  #    dup = result[idx]
  #    break
  #  end
  #end

  # finally, heap sort is selected because it is in-place sorting algorithm
  # and performance is also good as merge sort or quick sort
  heap_sort(arr)
  0.upto(arr.length - 2) do |idx|
    if arr[idx] == arr[idx+1]
      dup = arr[idx]
      break
    end
  end

  puts dup
end