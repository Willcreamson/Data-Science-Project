install.packages("FactoMineR")
library("FactoMineR")
install.packages("factoextra")
library("factoextra")

#Question 1 

prod = read.csv("C:\\Users\\willc\\Desktop\\R\\DS project\\productivity.csv", header=T, sep=' ')
attach(prod)
summary(prod)

# summary nous donnent les variables descriptives de notre jeu de donnees
# 600 observations =>C'est un jeu de donnees important 

#Question 2

which(is.na(prod),arr.ind=TRUE)

# Il y a 254 valeurs manquantes ce qui represente
#elles sont toutes presentent en colonne 8 ce qui veut dire 
#Ce qui est la colonne wip (le nombre de produits non finis elle a donc 254/600 42,3 % 
#de variables manquantes
#Ceci n'est pas negligeable

#Question 3

#On peut pour ce faire remplacer les valeurs manquantes par la moyenne de ces valeurs,
#imputation par la moyenne
#On peut supprimer une colonne si elle n'est pas cruciale � l'analyse
#
#On peut supprimer les lignes contenant ces valeurs manquantes, si elles ne sont pas
#tr�s nombreuses

#Question 4 

# On d�clare un vecteur vide, pour stocker les index des lignes o� la valeur de la huiti�me 
#colonne est Na

vec <- c()

#parcours des lignes

for (i in 1:nrow(prod)){
  
  #parcours des colonnes
  
  if(is.na(prod[i,8])){
    
    #On ajoute le num�ro de laligne au vecteur
    vec <- append(vec,i)
  }
} 

#supprimer les lignes � partir de leur index contenu dans le vecteur
print(vec)
prod_mod <- prod[-vec, ]
print("Dataset modifi�")
print(prod_mod)

#Question 5 

cor(prod_mod)







