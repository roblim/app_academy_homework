require 'benchmark'

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
  longest = arr.first
  arr.each_with_index do |el, idx1|
    arr.each_with_index do |el, idx2|
      longest = arr[idx2] if arr[idx2].length > longest.length
    end
  end
  longest
end

def dominant_octopus(arr)
  return arr if arr.length <= 1
  half = arr.length / 2
  left = dominant_octopus(arr.take(half))
  right = dominant_octopus(arr.drop(half))
  merge_octopus(left, right)
end

def merge_octopus(left, right)
  result = []
  until left.empty? || right.empty?
    left.first.length <= right.first.length ? result << left.shift : result << right.shift
  end
  result + left + right
end

def clever_octopus(arr)
  result = arr.first
  arr.each { |fish| result = fish if fish.length > result.length }
  result
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, arr)
  arr.each_with_index { |tile, idx| return idx if dir == tile }
end

tiles_hsh = { "up" => 0,
              "right-up" => 1,
              "right" => 2,
              "right-down" => 3,
              "down" => 4,
              "left-down" => 5,
              "left" => 6,
              "left-up" => 7
            }

def constant_dance(dir, tile_hash)
  tile_hash[dir]
end

p "sluggish_octopus: #{Benchmark.realtime { sluggish_octopus(fish) }}"
p "dominant_octopus: #{Benchmark.realtime { dominant_octopus(fish).last }}"
p "clever_octopus: #{Benchmark.realtime { clever_octopus(fish)}}"
p "slow_dance: #{Benchmark.realtime {slow_dance("up", tiles_array)}}"
p "constant_dance: #{ Benchmark.realtime { constant_dance("up", tiles_hsh) } }"
