german_credit %>% 
      dplyr::select(amount,amount_hasta_684,amount_desde_2978) %>% View()


modelo_logit_3$fitted.values


german_credit$pred_modelo3 <- predict(modelo_logit_3,type="response")

predict(modelo_logit_1,type="response")
modelo_logit_1$fitted.values

0.0352316832 
0.6322624134

german_credit %>% 
     dplyr::select(amount,duration,pred_modelo3) %>% View()





Para tener un mayor control del modelo, y en vistas de lo solicitado por el ejercicio, se realiza un cuarto modelo, donde se parte del modelo 1, y se cambia duration y amount por los efectos no lineales encontrados con el algoritmo MARS.

```{r}


german_credit$amount_hasta_684<-((684-german_credit$amount)<0)*0+((684-german_credit$amount)>=0)*(684-german_credit$amount)
german_credit$amount_desde_2978<-((german_credit$amount-2978)<0)*0+((german_credit$amount-2978)>=0)*(german_credit$amount-2978)


# nuevo_modelo_final<-glm(formula = formula,data =tabla,family=gaussian)
# pander(summary(nuevo_modelo_final))
```








#Creo el modelo
modelo_logit_4<-glm(response~foreign,
                    data=german_credit ,
                    family=binomial(link="logit"))

#Analizo el summary
summary(modelo_logit_4)

german_credit$probabilidad_estimada <- predict(modelo_logit_4,type="response")

german_credit %>% 
      dplyr::select(foreign,probabilidad_estimada) %>% View()
      
      dplyr::filter(age>50) %>% 
      summarise(
            mean(probabilidad_estimada)
      )
      
      german_credit$probabilidad_estimada
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      predict(
            Ridge,
            type="response",
            s = Ridge2$lambda.min,
            newx=model
      )
      
      
      
      library(ROCit)
install.packages("ROCit")




* Hasta 684 marcos alemanes (en el diccionario habla de DM que son marcos alemanes) el beta sería -0.0080765. Como en este tramo se hace amount-684, y amount es menor a 684, entonces el importe resultante será negativo, que al multiplicar por el beta negativo, dará un resultado positivo. , por lo que la probabilidad de que un crédito sea malo va a depender del resto de variables.

* De 684 hasta 2978, el beta es de  -0.0080765, lo que implica que entre ese rango, a mayor monto menor probabilidad de que el crédito sea malo. 

* De 2978 en adelante, el beta es 0.0082542, por lo que a medida que incrementa el importe del préstamo, mayor es la probabilidad de que el crédito resulte malo.