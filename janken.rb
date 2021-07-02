=begin
1-->F
2-->F
3-
=end
class Player
  def hand
    # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
    #affichez une phrase qui permet au joueur de sélectionner une main pierre-papier-ciseaux.
    puts "Veuillez saisir un nombre."
    puts "0: Goo, 1: Choki , 2: Par"
    # 変数「input_hand」にプレイヤーの入力値を代入します。
    # ヒント：getsメソッドについて調べてみましょう。
    input_hand =gets
    # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
    while true
      if input_hand.respond_to?(:to_i) && [0,1,2].include?(input_hand.to_i)
        return input_hand
      else
        puts "Veuillez saisir les chiffres 0 à 2"  
        input_hand =gets
        end 
      end
    end
  end



class Enemy
  def hand
    a=rand(2);
    puts a
    return a
    # Goo、Choki、Parの値をランダムに取得する。
  end
end
# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # Remplacez ["goo", "choki", "par"] la variable "janken".  
    janken = ["Goo", "Choki", "Par"]
    #「相手の手は#{相手の手}です。」と出力させます。
    puts "相手の手は #{janken[enemy_hand]}です。"
    puts player_hand.to_i==enemy_hand.to_i 
      if player_hand.to_i==enemy_hand.to_i 
        puts "あいこ 愛子が出ています"
        return true
        # Renvoie "true" pour exécuter à plusieurs reprises des roche-papier-ciseaux.
        # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
         elsif (player_hand.to_i - enemy_hand.to_i+3)%3==1
            puts "「あなたの勝ちです」を出力します。"
            return false
             else
              puts "「あなたの負けです」を出力します。"
              return false
              #「false」を返してじゃんけんを終了させます。
              end
          end
   end

# Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # Remplacez le Player instancié par la variable "player".
    player = Player.new
    #Assignez une instanciation d'Enemy à la variable "ennemi".
    
    enemy = Enemy.new
    #Assignez une instanciation de Janken à la variable "janken".
    
    janken = Janken.new
    next_game=true
    # 変数「next_game」に「true」を代入しましょう。
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    while next_game
      # J'utilise des roche papier ciseaux avec "janken.pon (player.hand, ennemi.hand)".
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# Appelez la méthode jankenpon avec le nom de la classe.
GameStart.jankenpon