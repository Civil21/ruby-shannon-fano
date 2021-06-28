module RubyShannonFano
  # формую хеш з початкового повідомлення, де символ - ключ ,
  # а значення - кількість повторів у повідомлені
  def get_count_hash(text)
    base_array = text.split('')
    hash = {}
    base_array.uniq.each { |x| hash[x] = base_array.count(x) }
    hash
  end

  # сортую отриманий хеш - отримую масив
  def sort_hash(hash)
    hash.sort { |a, b| a[1] <=> b[1] }.reverse
  end

  # розбиваю отриманий масив методом поділу каменів на кучі
  # в циклі визначаю елементів на половину ваги підмасиву
  # якщо елемент єдиний повертаю його як результат
  # якщо елементів декілька обробляю рекурсивно
  # отримую хеш де ключ це
  def div_stone(base_array, prefix = '')
    sum_count = base_array.inject(0) { |sum, x| sum + x[1] }
    m = 0
    select_sum = 0
    while select_sum + base_array[m][1] < sum_count / 2
      select_sum += base_array[m][1]
      m += 1
    end
    final_hash = {}
    if m == 0
      final_hash[prefix + '0'] = base_array[0][0]
    else
      final_hash.merge!(div_stone(base_array[0..m], prefix + '0'))
    end
    if (base_array.length - m) == 2
      final_hash[prefix + '1'] = base_array[m + 1][0]
    else
      final_hash.merge!(div_stone(base_array[m + 1..base_array.length], prefix + '1'))
    end
    final_hash
  end

  # формую зручні масиви(хеші) для кодування та декодування
  def build_cod_array(sort_array)
    code_hash = div_stone(sort_array)
    [code_hash.invert, code_hash]
  end

  # закодовую , розбиваю на символи і підставлею відповідне значення з масиву
  def encode(text, char_hash)
    text.split('').map { |c| char_hash[c].to_s }.join
  end

  # розкодовую, беру по симовльно і шукаю співпадіння у масиві,
  # якщо не знайшов беру ще один симовол, продовжую до закінчення тексту
  def decode(text, code_hash)
    elements = text.split('')
    text = ''
    s = ''
    while elements.length > 0
      s += elements.shift.to_s
      unless code_hash[s].nil?
        text += code_hash[s]
        s = ''
      end
    end
    text
  end
end
