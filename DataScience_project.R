install.packages("FactoMineR")
library("FactoMineR")
install.packages("factoextra")
library("factoextra")


#Question 1 

prod = read.csv("C:\\Users\\willc\\Desktop\\R\\DS project\\productivity.csv", header=T)
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
#On peut supprimer une colonne si elle n'est pas cruciale à l'analyse
#
#On peut supprimer les lignes contenant ces valeurs manquantes, si elles ne sont pas
#très nombreuses

#Question 4 

# On déclare un vecteur vide, pour stocker les index des lignes où la valeur de la huitième 
#colonne est Na

vec <- c()

#parcours des lignes

for (i in 1:nrow(prod)){
  
  #parcours des colonnes
  
  if(is.na(prod[i,8])){
    
    #On ajoute le numéro de laligne au vecteur
    vec <- append(vec,i)
  }
} 

#supprimer les lignes à partir de leur index contenu dans le vecteur
print(vec)
prod_mod <- prod[-vec, ]
print("Dataset modifié")
print(prod_mod)

#Question 5 

#On travail sur la nouvelle table
attach(prod_mod)
cor(actual_productivity,team)
cor(actual_productivity,targeted_productivity)
cor(actual_productivity,smv)
cor(actual_productivity,wip)
cor(actual_productivity,over_time)
cor(actual_productivity,incentive)
cor(actual_productivity,no_of_workers)

# Deux variables sortent du lot premièrement, 
# la var incentive; corrélation de 0,815
# ensuite la var targeted_productivity 0,707
# Et on peut citer la var wip avec quand même 0,147

#Question 11
# Dans le cadre de régression linéaires simples, R² = r²
# On a     0<=  r,R <= 1
#On utilise le model de régression linéaire ajusté 
prod_mod.regsimple <- lm(actual_productivity~targeted_productivity,prod_mod)


#Question 12

prod_mod.regsimple$coefficients
summary(prod_mod.regsimple)

#Les coefficients sont: 
#B0 = -0,0646 et B1 = 1,088
# Valeur estimée de epsilon = 0.1069

#p value < 2.2e-1 => La pertinence de notre régression 
#linéaire, il y a une relation significative, entre la variable
# actual_productivity et targeted_productivity
par(mar=c(1, 1, 1, 1))
plot(actual_productivity,targeted_productivity)
title("targeted_productifity = f(actual_productivity)",sub="sub title",xlab="actual_prod",ylab="targeted_prod")
abline(prod_mod.regsimple, col='red')


#Question 13
# Intervalle de confiance de B1 et B2
# 







