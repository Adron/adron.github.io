---
title: The Three States of Roadways
author: Adron Hall
date: 2017-10-04 23:16:33
template: article.jade
---
A few weeks ago I posed a code challenge that was extremely open ended. It left a lot of elements to the imagination of the reader of the problem to research, determine, or just make up. In that same sense, here is the question that I posed on [Monday, September the 18th](/articles/thrashing-code-metal-monday-09-18-2017/).

> Given that roadways have three primary functions they’re used for: *active transport*, *storage or parking*, and *nil or no use*. Solve for what percentage of time a roadway experiences each. Details are further elaborated on here:

> Ask: Well what type of road is it, how many lanes, how many parking spots? What is the layout?

> Answer: Here are three types of roads specifically to solve for in a first attempt. These are specified just to have a starting point.

> * Country roadway: Two lanes, no parking spaces, and no area to pull off on. Each lane has a capacity of ~800-1200 cars per hour. Traffic on the particular road is about 8000 per day.
> * City arterial, 6-lanes: Two lanes each way, one lane parking on each side. Each lane has a theoretical capacity of about ~700-1000 cars per hour (that lane changing brings down the number). Traffic usually is about 12,000 per day.
> * Neighborhood street, 3-lanes: Single travel lane in the center, one parking lane on either side. Ability to move about ~500 cars per hour but only experiences about ~1500 cars per day.

> The challenge here far exceeds merely some algorithm to solve for X, but instead ponders what would need to be included to find transport use (driving or in movement), storage (parked car), and no car, no movement, and nobody parked anywhere to be seen (and empty road).

<span class="more"></span>

## My Solution

Key known things at this point.

1. There are three roads we want to solve for: country roadway, city arterial, and neighborhood street.
2. Respectively each has ~800-1200 cars per hour, ~700-1000 cars per hour, and the last specifically has ~500 cars per hour capacity but only about ~1500 per day.
3. Respectively each has 2 lanes, 6 lanes, and 3 lanes. Along with this a few other facts here and there.
4. We have no idea how many cars can park on or near one of these roads. We need to determine that.
5. We have no idea when these cars arrive or are not arriving. So maybe we'll just determine how long it takes for them to go by.

Let's just set some scope and guidelines for making these calculations.

1. The roadways we'll measure will be for exactly 1 kilometer.
2. The roadways, for initial simplicity of creating a solution, will not have any interruptive side roads, lights, stop signs, or such, but will just be merely 1 kilometer long without interruptions.
3. For parked cars, I'm going to say the average length of a car is equal to a Toyota Camry. That used to be one of the most sold cars in the US, and is a pretty in between size. It's not a huge truck, but it also isn't a Mini Cooper! The dimensions for a 2017 Toyota Camry are 191″ L x 72″ W x 58″ H. Let's imagine that in the front and rear of the car we need at least some space, so I'll calculate that at half a meter in front and half a meter in back. So 191 inches is 4.851 meters (*that's based on 39.3701 inches per meter*), plus the space in front and back, gives us 5.851 meters. For the width, the Camry is 72 inches giving us 1.828 meters width, and a height of 58 inches doesn't really matter in these calculations. In summary, our parking places will need to be 1.828 meters wide by 5.851 meters in length.
4. I wrote the capacity of each roadway per hour, and for these calculations I'll continue to assume the capacity per hour is what the road actually experiences.
5. For the time period to determine parked, moving, or empty space, I'll start working with a 12 hour period. I'll just assume we're talking about a 12 hour period that is inclusive of the work day.

That gives me a few points now to really start working with. Let's also make the following rules:

* I'll refer to parking, or storage of a car on the road simply as storage or ***S*** from now on.
* For a moving car, truck, bus, or other vehicle in use for transport I'll refer to simply as transport, transporting, or ***T***.
* For road space that is not in use and has no vehicles, I'll call that dead space, or ***D***.

Now let's work back with this added information combined with the assumptions I've drawn up.



<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>

https://thinkgrowth.org/https-medium-com-mrogati-bobross-2bc000f0d4bd
