class Gallows

  def self.display_gallows(counter)
    # consider using a hash or an array here.
    case counter
    when 1
      self.display1
    when 2
      self.display2
    when 3
      self.display3
    when 4
      self.display4
    when 5
      self.display5
    when 6
      self.display6
    else self.display0
    end

  end

  def self.display0
  puts '
            ==============
              |         ||
              |         ||
      |---------------| ||
      |     Space     | ||
      |   Available   | ||
      ----------------- ||
                        ||
                        ||
                        ||
            ==============
      '
  end


  def self.display1
      puts '
            ==============
              |         ||
              |         ||
            /---\       ||
             > <        ||
              ~         ||
                        ||
                        ||
                        ||
                        ||
                        ||
                        ||
            ==============
      '
  end

  def self.display2
    puts '
          ==============
            |         ||
            |         ||
          /---\       ||
           > <        ||
            ~         ||
            |         ||
                      ||
                      ||
                      ||
                      ||
                      ||
          ==============
    '
  end

  def self.display3
    puts '
          ==============
            |         ||
            |         ||
          /---\       ||
           > <        ||
            ~         ||
            |/        ||
                      ||
                      ||
                      ||
                      ||
                      ||
          ==============
    '
  end

  def self.display4
    puts '
          ==============
            |         ||
            |         ||
          /---\       ||
           > <        ||
            ~         ||
           \|/        ||
            |         ||
                      ||
                      ||
                      ||
                      ||
          ==============
    '
  end

  def self.display5
    puts '
          ==============
            |         ||
            |         ||
          /---\       ||
           > <        ||
            ~         ||
           \|/        ||
            |         ||
             \        ||
              \       ||
                      ||
                      ||
          ==============
    '
  end

  def self.display6
    puts '
          ==============
            |         ||
            |         ||
          /---\       ||
           > <        ||
            ~         ||
           \|/        ||
            |         ||
           / \        ||
          /   \       ||
                      ||
                      ||
          ==============
    '
  end

end
