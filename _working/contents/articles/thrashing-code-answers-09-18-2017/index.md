---
title: The Three States of Roadways
author: Adron Hall
date: 2017-10-04 23:16:33
template: article.jade
---
A few weeks ago I posed a code challenge that was extremely open ended. It left a lot of elements to the imagination of the reader of the problem to research, determine, or just make up. In that same sense, here is the question that I posed on [Monday, September the 18th](/articles/thrashing-code-metal-monday-09-18-2017/). The code challenge as I was saying wasn't some simple, solve it in 5 minutes, type of thing. This was something where we humans actually have real problems to solve in the world. So here we go, this is going to get seriously intense (and long cuz' I'm gonna describe every bit of my process). I'll start with a quick recap of the problem.

> Given that roadways have three primary functions they’re used for: *active transport*, *storage or parking*, and *nil or no use*. Solve for what percentage of time a roadway experiences each. Details are further elaborated on here:

> Ask: Well what type of road is it, how many lanes, how many parking spots? What is the layout?

> Answer: Here are three types of roads specifically to solve for in a first attempt. These are specified just to have a starting point.

**NOTE:** I added pictures of the road types by using [Street Mix](https://streetmix.net/). If you're interested in road alignments then this tool might consume a few hours of your day, so beware!

<span class="more"></span>

<div class="image float-right">
    [![Country Road](country-road.png)](https://streetmix.net/)
</div>

> * Country roadway: Two lanes, no parking spaces, and no area to pull off on. Each lane has a capacity of ~800-1200 cars per hour. Traffic on the particular road is about 8000 per day.

**Note:** I added a tram to the picture, but it is not there for calculation reasons. It's there merely because I wanted to have a tram there. The focus on this is still entirely the public roadway to the left of the tram.)

<div class="image float-right">
    [![City Arterial](city-arterial.png)](https://streetmix.net/)
</div>

> * City arterial, 6-lanes: Two lanes each way, one lane parking on each side. Each lane has a theoretical capacity of about ~700-1000 cars per hour (that lane changing brings down the number). Traffic usually is about 12,000 per day.

<div class="image float-right">
    [![Neighborhood Street](neighborhood-street.png)](https://streetmix.net/)
</div>

**NOTE:** The travel lane in the center, even though it has an arrow for one way, is actually bi-directional. It's very similar to a lot of the older town center organized neighborhoods as seen in Brooklyn in New York, in Ballard or a number of other neighborhoods in Seattle, and many in Portland. Almost every major US city has neighborhoods with small streets like this, often an indicator of a time when it wasn't assumed you put your person property (a car) in the road and the road was actually considered public domain by the general populace. But I digress, back to the coding problem.

> * Neighborhood street, 3-lanes: Single travel lane in the center, one parking lane on either side. Ability to move about ~500 cars per hour but only experiences about ~1500 cars per day.

> The challenge here far exceeds merely some algorithm to solve for X, but instead ponders what would need to be included to find transport use (driving or in movement), storage (parked car), and no car, no movement, and nobody parked anywhere to be seen (and empty road).

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
5. For the time period to determine parked, moving, or empty space, I'll start working with a 24 hour period.

That gives me a few points now to really start working with. Let's also make the following rules:

* I'll refer to parking, or storage of a car on the road simply as storage or ***S*** from now on.
* For a moving car, truck, bus, or other vehicle in use for transport I'll refer to simply as transport, transporting, or ***T***.
* For road space that is not in use and has no vehicles, I'll call that dead space, or ***D***.

Now let's work with this added information combined with the assumptions I've drawn up.

## S | Storage

**S** should be easy to determine as I only need to determine what can fit on the side of a road. The *country road* is easy, since there is no parking. The other two I wrote there is a lane of parking on each side of the street. For those two, that would be 1 kilometer divided by the 5.851 meters, then multipled by 2 since there are two sides to the road. There are a thousand meters in a kilometer so our initial work looks like this.

S = 1000 / 5.851 * 2.

Which gives us 170.910955392 parking spaces per side, I'll round down just to have a clean 170 spots per roadside, giving us 340 parking sports per kilometer of roadway. This should suffice on both of the roads listed above.

I also added time above, because time is fundamental element to determine the actual metrics above, but that leaves me with a question of how frequently to spaces rotate.

***TO THE GOOGLES***

I did some research here about parking in various cities to get an idea for turnover rate. I specifically searched for `parking turnover in seattle` and `parking turnover in portland`. Holy smokes I hit the jackpot of data right off with those. My google-fu is on point. If you ever were curious if someone was actually thinking about where, when, how, and what we can park, rest assured there is a massive amount of thought that goes into it.

**Portland Links:**

* [State of Parking](https://www.portlandoregon.gov/transportation/article/554181)
* [Public Parking in The City of Portland](https://www.portlandoregon.gov/transportation/article/547703)
* [PBOT page with many of the above and other links](https://www.portlandoregon.gov/transportation/68834)
* [Central City Parking Occupancy and Turnover Analysis](https://www.portlandoregon.gov/transportation/article/547325)

**Seattle Links:**

* [Seattle Parking Management Study](http://www.seattle.gov/transportation/pdf/SeattleParkingStudyFinalReport.pdf)
* [Performance Based Parking](https://www.seattle.gov/transportation/parking/docs/SDOT_PbPP_FinRpt.pdf)

I then went about reading through them all and then realized, this is vastly more complex then it needs to be for the immediate moment. With that conclusion, I realized it ought to just be a variable and I'll make one up upon executing the function.

There's one more thing that just popped into my head, to help get an actual measurement of things I'd also need to know what percent of the spots stay empty over time. I'll measure the number of parking spots empty per hour. This is so we can also determine later how much empty parking lends to unused roadway space.

With that, here we go.

* Time Being Measured in Hours = T
* Parking Space (Length in meters) = P
* Roadway Distance (Length in meters) = R
* Turnover Rate (Cars Parked Per Hour) = H
* Empty Spots (Average # Per Hour) = E

Where S is the total time cars are parked in parking spots on the roadway.

```
S = ((R / P) - E) * H * T
```

## T | Transport / Transporting

Whew, I've got **S**, next up is **T** for the number of vehicles moving by per hour. I actually provided the cars per hour on the roadway, but that leaves us to determine how much of the roadway is actually being used to move that number of cars. Let's try to get a decent ballpark figure.

For the *country road* I stated that it has 8000 cars per day. For the *arterial road* the route has about 12,000 per day, and for the *neighborhood street* there are only about 1500. I also stated the throughput of each road, so let's use the country road as an example and work from that.

I originally stated a 800-1200 cars per hour, with 8000 traveling through the road per day. A day is 24 hours of course. Let's work with the idea we're getting maximum throughput of 1200 cars per hour. If there is 8000 cars per day, at 1200 per hour, we could divide the total per day by the hours like 8000 / 1200 = hours it takes to have 8000 cars travel the road. Which in this case, is 6.666666666 hours. How devilish!

The equation then looks something like this.

* The total cars traversing the road = D
* The total cars that can travel through the road per hour = H

Where T is the total hours in which transporting is being done.

```
T = D / H
```

## D | Dead Space

Alright, so this equation is going to take into account the time left and is going to also get super tricky. More on its trickiness after I post the solution though. For now, soffice to say the total dead space is the remainder hours when cars aren't traversing and also the dead time of cars not parked. At least, that's what I'll go with for now.

* Transport or Transporting (the result of the above T equation) = T
* Empty parking spots per hour, value available from determinant in the S equation as = E

Where D is the hours of dead space on the road.

```
D = T + E
```

Alright it's time to sling some code now that the pieces are collected.

# CODE!

First things first, I'm going to put in place a test for each of these functions that I'll need. These tests are by no means a paramount example of testing, nor do they test much of anything besides the extreme happy path, but they'll be perfect for getting started to verify the functions we'll write. The tests also will provide the basis in which to extend past these calculations in the future and really start to extrapolate this into a project that *gasp* may be a real usable thing.

I've created a `thrashed.go` and `thrashed_test.go` file for this initial bit of coding. The first test I've added in the test file is the test for what I'll call the Storage function.

``` javascript
func TestStorage(test *testing.T) {

	var t float32 = 24    /* 24 hours in a day. */
	var p float32 = 5.851 /* Meters a parking space needs to be */
	var r float32 = 1000  /* Meters of roadway distance in calculation */
	var h float32 = 1.8   /* Cars parked per hour in a single parking spot. */
	var e float32 = 8     /* Empty parking spots per hour for the measured distance. */

	if Storage(t, p, r, h, e) != 7037.753 {
		test.Error("Failure to determine correct storage result.")
	}
}
```

I'm a big fan of tests being a good source of documentation and how to use a set of functions or libraries. With that in mind I've added a few comments to define what each variable is. In the `thrashed.go` file I dive into implementing the calculation for storage.

``` javascript
func Storage(TimeBeingMeasured float32, ParkingSpace float32, RoadwayDistance float32, TurnoverRate float32, EmptySpots float32) float32 {
	return ((RoadwayDistance / ParkingSpace) - EmptySpots) * TurnoverRate * TimeBeingMeasured
}
```

I'm not happy with this example, as I wrote out every variable so that they're self descriptive. But it leaves the function signature a bit long. Even though it won't be self descriptive, I'm going to turn these into acronyms for now. Late I'll resolve the naming problem, because it's a road block otherwise and as we all know, naming stuff is hard. For now, just for now, I'm going to refactor the storage function to look like this.

``` javascript
func Storage(tbm float32, ps float32, rd float32, tr float32, es float32) float32 {
	return ((rd / ps) - es) * tr * tbm
}
```

Am I happier with that? Not really, but it at least fits on the screen. Anyway, on to the next metric to measure. Following good practice, a test first.

``` javascript
func TestTransport(t *testing.T) {

	var d int = 8000 /* Total cars traveling the roadway for the test time frame. */
	var h int = 1200 /* The number of cars that can travel the roadway per hour. */

	result := Transport(d, h)

	fmt.Println(result)

	if result != 6.6666665 {
		t.Error("Failure to determine correct transportation throughput.")
	}
}
```

Then I implement it with this.

``` javascript
func Transport(TotalCars int, CarsPerHour int) float32 {
	return float32(TotalCars) / float32(CarsPerHour)
}
```

Now for the dead space test.

``` javascript
func TestDeadSpace(test *testing.T) {
	var t int = 23 /* Transport or transporting (the result of the "Transport" equation). */
	var e int = 2  /* Empty parking sports per hour. This value is what would be the same \
	as the E value in the Storage function. */

	result := DeadSpace(t, e)
	if result != 25 {
		test.Error("Nope that isn't the correct amount of dead space.")
	}
}
```

Then implementation of it.

``` javascript
func DeadSpace(t int, e int) int {
	return t + e
}
```

With those functions in place I can now, finally, after all this work move toward an initial answer! Now I'm going to write a set of tests, one for each of the percentages that are requested in the original code challenge. One test for the storage, transport, and dead space percentages. For these tests, I'm doing a nice easy split of storage, transport, and dead space; 50, 75, and 75. That was I can calculate it out in my head if need be.

``` javascript
func TestGimmeTheStoragePercent(t *testing.T) {
	result := GimmeTheSolutionAlready(50, 75, 75)

	if result[0] != 25 {
		t.Error("The storage percentage is not correct.")
	}
}

func TestGimmeTheTransportPercent(t *testing.T) {
	result := GimmeTheSolutionAlready(50, 75, 75)

	if result[1] != 37.5 {
		t.Error("The transport percentage is not correct.")
	}
}

func TestGimmeTheDeadspacePercent(t *testing.T) {
	result := GimmeTheSolutionAlready(50, 75, 75)

	if result[2] != 37.5 {
		t.Error("The dead space percentage is not correct.")
	}
}
```

My implementation that I then put together looks like this.

``` javascript
func GimmeTheSolutionAlready(storage float64, transport float64, deadspace float64) []float64 {
	var quotient = (storage + transport + deadspace) / 100
	var storagePercent = storage / quotient
	var transportPercent = transport / quotient
	var deadspacePercent = deadspace / quotient

	var result []float64
	result = append(result, storagePercent)
	result = append(result, transportPercent)
	result = append(result, deadspacePercent)

	return result
}
```

Did I do it right? Here's the [Github Repo](https://github.com/Adron/thrashing-code-answers-09-18-2017)! Whew, I'll check it a bit later, but happy for someone else to point out an error or code mishap! Overall though, this is my first brutally long rough draft of code with a few unit tests and this whole blog entry written!

I'm also interested in what else you think should go into this mix. I'm likely to turn this into a CLI just for fun and would like to add additional complexities into it, so that when I implment the CLI it can create the actual story of what this tells us about a roadway. So get out your urban planner, car counting, road nerd glasses and let me know what your thoughts are.

Until next code challenge, or ya know whenever, happy coding!

**References Collection:**

* [Github Repo](https://github.com/Adron/thrashing-code-answers-09-18-2017) (of this code)
* [State of Parking](https://www.portlandoregon.gov/transportation/article/554181)
* [Public Parking in The City of Portland](https://www.portlandoregon.gov/transportation/article/547703)
* [PBOT page with many of the above and other links](https://www.portlandoregon.gov/transportation/68834)
* [Central City Parking Occupancy and Turnover Analysis](https://www.portlandoregon.gov/transportation/article/547325)
* [Seattle Parking Management Study](http://www.seattle.gov/transportation/pdf/SeattleParkingStudyFinalReport.pdf)
* [Performance Based Parking](https://www.seattle.gov/transportation/parking/docs/SDOT_PbPP_FinRpt.pdf)
