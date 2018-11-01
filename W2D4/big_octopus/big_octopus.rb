fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  result = fish.first

  fish.each do |fish1|
    fish.each do |fish2|
      result = fish2 if fish1.length < fish2.length
    end
  end
  result
end

def dominant_octopus(fish)
  prc = Proc.new { |x, y| y.length <=> x.length }

  merge_sort(fish, &prc)[0]
end

def merge_sort(arr, &prc)
  prc ||= Proc.new { |x,y| x<=> y }
  return arr if arr.length <= 1

  mid = arr.length
  left = merge_sort(arr[0..mid], &prc)
  right = merge_sort(arr[mid..-1], &prc)

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  result = []
  until left.empty? || right.empty?
    if prc.call(left.first, right,first ) == 1
      result << right.shift
    else
      result << left.shift
    end
  end

  result + left + right
end

def clever_octopus(fish)
  result = fish.first
  fish.each do |fish|
    result = fish if result.length < fish.length
  end
  result
end

TILE_DIRECTION = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile_direction)
  TILE_DIRECTION.each_with_index { |el, i| return i if el == tile_direction }
end

TILE_DIRECTION_HASH = {
  "up": 0,
  "right-up": 1,
  "right": 2,
  "right-down": 3,
  "down": 4,
  "left-down": 5,
  "left": 6,
  "left-up": 7
}

def constant_dance(tile_direction)
  TILE_DIRECTION_HASH[tile_direction]
end
