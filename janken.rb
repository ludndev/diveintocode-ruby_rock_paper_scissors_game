# puts `clear`

class Player
  def hand
      # afficher le meny
      puts "Veuillez entrer un numéro."
      puts "0: rock" # pierre
      puts "1: paper" # pappier
      puts "2: scissors" # ciseaux
      # recuperer le choix sans le retour chariot (\n)
      hand = gets.chomp
      # tant que choix = 0 ou 1 ou 2, afficher le menu
      until (hand == "0" || hand == "1" || hand == "2")
        puts 
        puts "Veuillez saisir un nombre entre 0 et 2."
        puts 
        player = Player.new
        player.hand.new
      end
      # recuperer l'input convertit en entier
      player_hand = hand.to_i
  end
end


class Enemy
  def hand
    # enemy_hand = chiffre aléatoir compris en 0 et 2
    enemy_hand = rand(3)
    return enemy_hand
  end
end


class Janken
  def pon(player_hand, enemy_hand)
    # choix possibles
    janken = ["rock", "paper", "scissors"]

    puts 
    # match nul
    if player_hand == enemy_hand
      puts "La main de votre adversaire est #{janken[enemy_hand]}, donc c'est un match nul."
      return true
    # winner
    elsif (player_hand  == 0 && enemy_hand == 1) || (player_hand  == 1 && enemy_hand == 2) || (player_hand  == 2 && enemy_hand == 0)
      puts "La main de votre adversaire est #{janken[enemy_hand]} et vous gagnez."
      return false
    # perte
    else
      puts "La main de votre adversaire est #{janken[enemy_hand]}, et vous perdez."
      return false
    end
  end
end


class GameStart
  # En utilisant self, vous pouvez appeler la méthode jankenpon en utilisant le nom de la classe sans instancier GameStart.
  def self.jankenpon
    # Remplacez le Player instancié par la variable "player".
    player = Player.new
    # Assignez une instanciation d'Enemy à la variable "ennemi".
    enemy = Enemy.new
    # Assignez une instanciation de Janken à la variable "janken".
    janken = Janken.new
    # Assigner "true" à la variable "next_game".
    next_game = true
    # Si "next_game" est "false", le processus d'itération est terminé, et s'il est "true", le processus d'itération est poursuivi.
    while next_game
      # Assignez la valeur retournée par l'exécution de janken (pierre-papier-ciseauxx) à la variable "next_game" (valeur de retour).
      # "janken.pon(player.hand, enemy.hand)" exécute le pierre-papier-ciseauxx.
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

# Appeler la méthode jankenpon en utilisant le nom de la classe.
GameStart.jankenpon
