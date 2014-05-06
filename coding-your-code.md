#Coding Your Code

Earlier today, you had to work out the logic of your baller apartment, and your business partner's ill-behaved pooch. As many of you were working through this, you had to go through the process of not only figuring out what you needed to do at a very granular level, you then had to get the Ruby code written to accomplish it. 

What we will do for this session is to go through and work on a collaborative example and talk through the process of deconstructing the decision-making, applying the applications, building the business logic, and coding the code. And we'll also get away from alliterations. Except for that one. 

##Scenario
You work in a sign shop, making banner signs for customers. Customers are going to come in and want a quote on a sign, based on the dimensions, and the colours.

Here are your rules:

* Signs are $15 per square foot
* If it is two colours or less, it is $10/colour, otherwise it is $15/colour
* Tax is 15%
* The boss insists that he just wants one function that he can put the dimensions and colour count in, and get the total back

##Considerations
We have several features (hint: feature = function/method) here that we need to build. The main things we need to consider are

* In what order do we need to calculate this? Does it matter?
* What is the problem we need to solve?
* How can we organize this in order to make it easier to add more features in the future?
* What else could we add to this in order to make it a more full-featured (robust) tool?

