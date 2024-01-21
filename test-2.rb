

@field = [".", ".", ".",
          ".", ".", ".",
          ".", ".", "."]

@isWon = false
@turn = false
@test_value = 1
@test_for_demo_branch = 1

def render
  print @field[0] + " " + @field[1] + " " + @field[2] + "\n"
  print @field[3] + " " + @field[4] + " " + @field[5] + "\n"
  print @field[6] + " " + @field[7] + " " + @field[8] + "\n"
  puts ""
end

def cellIsFull
  puts ""
  puts "Клетка #{@enter} уже занята!"
  render()
  puts ""
end

def cellValid
  if @turn == false
    if @field[@enter - 1] == "."
      @field[@enter - 1] = "x"
      @turn = true
      render()
    else
      cellIsFull
    end
  elsif @turn == true
    if @field[@enter - 1] == "."
      @field[@enter - 1] = "o"
      @turn = false
      render()
    else
      cellIsFull
    end
  end
end

def entering()
  if @turn == false
    puts "Введите КРЕСТИК"
    @enter = gets.chomp.to_i

    if (@enter > 9) || (@enter < 1)
      puts "Введите число от 1 до 9!"
    else
      cellValid()
    end
  elsif @turn == true
    puts "Введите НОЛИК"
    @enter = gets.chomp.to_i

    if (@enter > 9) || (@enter < 1)
      puts "Введите число от 1 до 9!"
    else
      cellValid()
    end
  end
end

render()
puts "Введите число от 1 до 9, в этом месте будет ход"
sleep 1.5
puts "Первыми ходят крестики"

while @isWon == false
  if @field.include?(".") == false
    @isWon = true
    puts "Ничья!"
    gets
  else
    entering()

    if (@field[0].to_s + @field[1].to_s + @field[2].to_s) == "xxx" ||
       (@field[3].to_s + @field[4].to_s + @field[5].to_s) == "xxx" ||
       (@field[6].to_s + @field[7].to_s + @field[8].to_s) == "xxx" ||
       (@field[0].to_s + @field[3].to_s + @field[6].to_s) == "xxx" ||
       (@field[1].to_s + @field[4].to_s + @field[7].to_s) == "xxx" ||
       (@field[2].to_s + @field[5].to_s + @field[8].to_s) == "xxx" ||
       (@field[2].to_s + @field[4].to_s + @field[6].to_s) == "xxx" ||
       (@field[0].to_s + @field[4].to_s + @field[8].to_s) == "xxx"
      @isWon = true
      puts "КРЕСТИКИ ПОБЕДИЛИ"
      puts "Выход через 10 секунд"
      sleep 10
      exit
    elsif (@field[0].to_s + @field[1].to_s + @field[2].to_s) == "ooo" ||
          (@field[3].to_s + @field[4].to_s + @field[5].to_s) == "ooo" ||
          (@field[6].to_s + @field[7].to_s + @field[8].to_s) == "ooo" ||
          (@field[0].to_s + @field[3].to_s + @field[6].to_s) == "ooo" ||
          (@field[1].to_s + @field[4].to_s + @field[7].to_s) == "ooo" ||
          (@field[2].to_s + @field[5].to_s + @field[8].to_s) == "ooo" ||
          (@field[2].to_s + @field[4].to_s + @field[6].to_s) == "ooo" ||
          (@field[0].to_s + @field[4].to_s + @field[8].to_s) == "ooo"
      @isWon = true
      puts "НОЛИКИ ПОБЕДИЛИ"
      puts "Выход через 10 секунд"
      sleep 10
      exit
    end
  end
end
