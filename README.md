# isTippedBasedOnTShirtColor
Analysing data if waitress' or waiter's T-Shirt color has an impact if she or he is getting tipped.

## Task and data

It is thought, that customer leave more often tips when the waitress is wearing red T-Shirt. So, let's dive into the data and let's see whether it's true or not.
In our dataset we have these variables:
- Color - indicates the color of t-shirt the waitress is wearing.
- Tipnum - the variable which indicates if customer tipped or not. When tipnum = 1 - customer tipped.
- Male - indicates the client's sex. When male = 1 - client is male.
- Black - When black = 1, it means waitress is wearing black T-Shirt, and when black = 0, it means waitress is not wearing black t-shirt.
- White - "--"
- Yellow - "--"
- Blue - "--"
- Green - "--"

**Note:** when every variable black, white, yellow, blue and green are equal to zero, it that waitress is wearing red t-shirt.
**Dataset report:**

![image](https://user-images.githubusercontent.com/39278922/104834335-509a3c00-58a7-11eb-84a6-5eea1565a426.png)

Here sampsz variable indicates, how many observations we have of each group.

## Analysis results and conclusions

I'm going to work with the data where only the observed customers are men. I'm analysing this logistic regression model:

![image](https://user-images.githubusercontent.com/39278922/104834548-c8b53180-58a8-11eb-9415-18fbeea2391c.png)

First of all, let's see if we have enough data in each color group to work with: 

![image](https://user-images.githubusercontent.com/39278922/104834564-eedad180-58a8-11eb-9420-cce445040b1f.png)

It seems that we have enough data, since frequency of each group is over 5.

Next, let's see if every independent varialbe is statistically significant:

![image](https://user-images.githubusercontent.com/39278922/104834595-2c3f5f00-58a9-11eb-9a76-82f0a15373cd.png)

Since our <a href="https://www.codecogs.com/eqnedit.php?latex=\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\alpha" title="\alpha" /></a> = 0.95, we can see that yellow variable is statistically insignificant and we should remove it from the model.

Once it's removed, let's check Analysis of Maximum Likelihood Estimates table again:

![image](https://user-images.githubusercontent.com/39278922/104835146-3ebb9780-58ad-11eb-9948-0e341cd9007d.png)

Now we see that our every variable is statistically significant and we can continue work with this model.

Our convergence criterion is satisfied:

![image](https://user-images.githubusercontent.com/39278922/104835164-60b51a00-58ad-11eb-9a0d-b0382b3135c6.png)

AIC criterion shows that our model is suitable as well:

![image](https://user-images.githubusercontent.com/39278922/104835176-7e827f00-58ad-11eb-9941-fc1e2bcd0cf2.png)

Let's see if our model is accurate to our data: 

![image](https://user-images.githubusercontent.com/39278922/104835196-a2de5b80-58ad-11eb-948d-1481d32b0c07.png)

From this table, we can see that **c** coefficient is only 0.593. It means, the model is better than trying to predict the outcome randomly, but it's still low.

The classification table is showing practically the same: 

![image](https://user-images.githubusercontent.com/39278922/104835246-ffda1180-58ad-11eb-958b-6cf872f2ee54.png)

Also, from this table we can see that our treshold is best when it's equal between 0.4 and 0.56.

Now, let's see if we have any outliers:

![image](https://user-images.githubusercontent.com/39278922/104835298-52b3c900-58ae-11eb-9d7c-34c7ed3d58ab.png)

![image](https://user-images.githubusercontent.com/39278922/104835308-63fcd580-58ae-11eb-8cc4-afd785120652.png)

![image](https://user-images.githubusercontent.com/39278922/104835317-6f500100-58ae-11eb-8bb2-66d6df97765a.png)

We can see that we don't have any outliers since Pearson Residual and DFBetas values are not exceeding their limits.

Thus, our model is suitable. We have this model:

![image](https://user-images.githubusercontent.com/39278922/104835352-b211d900-58ae-11eb-832d-e5d370afcbe0.png)

#### Model for population:

![image](https://user-images.githubusercontent.com/39278922/104835379-e2597780-58ae-11eb-91a6-2521bdfe1fb3.png)


#### Model for our data sample:

![image](https://user-images.githubusercontent.com/39278922/104835386-eeddd000-58ae-11eb-845a-034fcd80ef28.png)


![image](https://user-images.githubusercontent.com/39278922/104835419-2e0c2100-58af-11eb-9810-ef0e551590b6.png)


In order to calculate the probability of getting a tip (P(timnup = 1)), we would need to use this formula:

![image](https://user-images.githubusercontent.com/39278922/104835459-82170580-58af-11eb-8053-ef16b7835e5e.png)

I get these results when we are putting the specific numbers:
When waitress wear red T-Shirt, the probability of getting tipped is 0.1846;
Black - 0.2841;
White - 0.2586;
Green - 0.2513;
Blue - 0.2563;

We can see that when waitress is wearing the red T-shirt, it's the lowest chance of getting tipped. When waitress is wearing black T-shirt, she has the biggest chance of getting tipped, but the value isn't very significantly different from other color groups, which means, that there isn't really big difference what T-shirt the waitress is wearing.



