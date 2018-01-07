---
title: Algorithms 101 - Big Sums
author: Adron Hall
date: 2018-01-06 09:14:33
template: article.jade
---
I've been practicing up on some algorithms with Go per my [Resolutions for 2018](https://medium.com/@adron/resolutions-for-2018-99570995bf8) item "Write More Code, Build Patterns, Algorithms". Here's a few of the ones I took a quick review of, from the algorithm perspective.

The first algorithm I took a dive into is a big sum problem. Part of the reason is I wanted a refresher on how Go deals with various integer data types. Easier to set it to memory if I play around with the data types versus just simply reading up on the specifics.

<span class="more"></span>

## Big Sum!

Imagine being given an array of integers of size *N*. The task is to get the sum of the elements of the array and print each sum out. The added caveat is that each of the integers may be large.

### Input & Sample Input

The first line of the input consists of an integer *N*. The next line contains *N* space-seperated integers in the array. Sample input would look something like this.

```
3
1230983459 90232478345 2349432014
```

or

```
6
982734503 2938563459 100032400 9202345873 701346892 2345010900
```

### Output & Sample Output

Print a single value equal to the sum of the elements in the array.

Sample output for the first example input.

```
93812893818
```

Sample output for the second example input.

```
16270034027
```

## The Solution

Alright. Down to the task. The first thing I'll need is to setup getting the input into the application, a little standard input. For that I'll need to use the standard Go "fmt" library. In my main.go file I go ahead and create the start of the code.

``` javascript
package main

import (
    "fmt"
)
```

Next I'll write up the input for the index count, which is the first value passed in.

``` javascript
func main() {
    var arraySizeCount int64

    _, err := fmt.Scanf("%d", &arraySizeCount)
}
```

Now that I know the size of the array of data I'll be scraping up, I'll setup the array to put that data in. I'll add the next line of code just below the previous additions.

``` javascript
data := make([]int64, arraySizeCount)
```

With data now setup as the array I'll need, I can step through the data that is retreived from input and put values in the array. 

``` javascript
for i := range data {
	_, err = fmt.Scanf("%d", &data[i])
}
```

Next I'll need a variable for the total sum of the values in the array. I'll create that and then also step through the range of values in the array, adding them while I go.

``` javascript
var totalSum int64 = 0

for _, v := range data {
	totalSum += v
}
```

The final step involves an error catch, I'll print out the error, then display the value of the sum. That solves the algorithm in a short bit of code.

``` javascript
if err != nil {
	fmt.Print(err)
}

fmt.Printf("%d\n", totalSum)
```

All of the code together only amounts to 29 lines of code. One additional thing I could do, that might make it more readable is to break out the input phase and output phase of the function. The code currently looks like this.

``` javascript
package main

import (
	"fmt"
)

func main() {
	var arraySizeCount int64

	_, err := fmt.Scanf("%d", &arraySizeCount)

	data := make([]int64, arraySizeCount)

	for i := range data {
		_, err = fmt.Scanf("%d", &data[i])
	}
	
	var totalSum int64 = 0
	
	for _, v := range data {
		totalSum += v
	}
	
	if err != nil {
		fmt.Print(err)
	}
	
	fmt.Printf("%d\n", totalSum)
}
```

### A Refactoring?

As I start to refactor this code, as I mentioned, the existing code is only 29 lines of code. But I'm going to break it out into two functions; I'll call one `SumTotal` and one `DataRead`. My `SumTotal` function will take a list of 64 bit integer data types and return a single total 64 bit integer.

``` javascript
func SumTotal(list []int64) int64 {
	var totalSum int64 = 0

	for _, v := range list {
		totalSum += v
	}

	return totalSum
}
```

The `DataRead` function will have a 64 integer paramter and an error result. The function definition will look like `func DataRead() ([]int64, error) {}`. The function itself I'll have take in and get the input and also have it build the array. I get to work on that and pull the functionality out of the existing 29 lines of code into the function, which I end up with a function that looks like this.

``` javascript
func DataRead() ([]int64, error) {
	var length int64

	_, err := fmt.Scanf("%d", &length)
	if err != nil {
		return nil, err
	}

	data := make([]int64, length)

	for i := range data {
		_, err := fmt.Scanf("%d", &data[i])
		if err != nil {
			return nil, err
		}
	}

	return data, nil
}
```

Now I just go ahead and wipe out what is in the `main` function of the code and replace it with the few lines to call the respective input, and lass it to the respective processor and finalize that by printing out the results.

``` javascript
func main() {
	data, err := DataRead()
	if err != nil {
		fmt.Print(err)
	}

	fmt.Printf("%d\n", SumTotal(data))
}
```

Now the whole file of code looks like this, which leaves one with a few questions.

``` javascript
package main

import (
	"fmt"
)

func main() {
	data, err := DataRead()
	if err != nil {
		fmt.Print(err)
	}

	fmt.Printf("%d\n", SumTotal(data))
}

func SumTotal(list []int64) int64 {
	var totalSum int64 = 0

	for _, v := range list {
		totalSum += v
	}

	return totalSum
}


func DataRead() ([]int64, error) {
	var length int64

	_, err := fmt.Scanf("%d", &length)
	if err != nil {
		return nil, err
	}

	data := make([]int64, length)

	for i := range data {
		_, err := fmt.Scanf("%d", &data[i])
		if err != nil {
			return nil, err
		}
	}

	return data, nil
}
```

Both of the solutions work and provide the desired result. However, one is refactored into input and output functions, with the main function minimized. In this particular situation does it even matter? One might say it's good to practice refactoring, but in the end did the refactored solution end up better in some way? I could argue that the latter is easier to read. I could say that the first solution was easier to read, since it was so much shorter. The argument could fall either way, but in the end it's a quick, simple, introductory algorithm and some simple refactoring.

If you've got a quick second, ping me [@Adron] if you've got suggestions, other refactoring, or other thoughts about this algorithm. I'm always open to a critical editorialization.

In the meantime, happy hacking!

References: The [repository](https://github.com/Adron/algorithms-101-a-big-sum) for this code I've written here is available on Github @ [algorithms-101-a-big-sum](https://github.com/Adron/algorithms-101-a-big-sum)
