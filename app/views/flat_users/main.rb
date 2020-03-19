chaine = "aaaaabbbbaddeee"

lettre = ""
count = 0

liste_lettres = chaine.chars

liste_lettres.each_with_index do |l, index|
  lettre = l
  count += 1
  if lettre != liste_lettres[index - 1]
    puts "#{count}#{lettre}"
  end
end

