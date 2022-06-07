#Question 1 

prod = read.csv("C:\\Users\\willc\\Desktop\\R\\pr�pare l'interview de code\\productivity.csv")
attach(prod)
summary(prod)
#test de push sur Github

# summary nous donnent les variables descriptives de notre jeu de donn�es
# 600 observations =>C'est un jeu de donn�es important 


which(is.na(prod),arr.ind=TRUE)
# Il y a 254 valeurs manquantes ce qui repr�sente
#elles sont toutes pr�sentent en colonne 8 ce qui veut dire 
#Ce qui est la colonne wip (le nombre de produits non finis elle a donc 254/600 42,3 % 
#de variables manquantes
#Ceci n'est pas n�gligeable






