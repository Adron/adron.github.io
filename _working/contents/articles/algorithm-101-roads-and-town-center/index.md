---
title: Algorithm 101 Roads & Town Centers
author: Adron Hall
date: 2018-01-15 21:19:38
template: article.jade
---
Alright, there's this one algorithm that I've solved before. I've always found it to be a rather fun exercise to work out. It popped into my head recently and I wanted to recollect how it went, but my Google-fu wasn't so great. In the end, I didn't find the algorithm problem statement but I've recollected it as best as I could from memory. If you know what the name of this challenge is I'd love to know what it's called or if I've put it back together correctly. Ping me [@Adron](https://twitter.com/Adron).

So the story goes something like this. There once was a nation with a number of cities. Every citizen has access to every city and every city has a town center for all the citizens to enjoy. Recently the roads were damaged from a lack of maintenance work, ya know, like in real life. So now none of the cities have reachable town centers anymore! The citizens are angry and demand immediate fixes to their roads! The leaders have decided that the roads shall be repaired, and have hired you to assist!

The nation has n cities, we'll number 1 to n. The cities have two way roads, totalling m roads. A citizen has access to the town center if: their city contains a town center and their city has a road to travel from their city with a town center to another city with a town center.

The following is a map of this great nation of cities with currently impassable roads that must be repaired.

![Nation](nation.png)

<span class="more"></span>

The cost of road repair is c<sub>road</sub> and to build a town center is c<sub>town center</sub>. To start off with, you're given q queries, where each query consists of a map of the nation and the value of c<sub>road</sub> and c<sub>town center</sub>. For each of the queries the minimum cost of a town center accessible to all the citizens should be printed on a line.

## The Input

The first line is an integer, *q*, denoting the number of queries. The subsequent lines describe the queries in a particular format. Each query is basically formatted like this:

* The first line of each set for a query will have four integers describing the number of cities *n*, the number of roads, *m*, and the cost to build a town center c<sub>town center</sub>, and the cost to repair a road c<sub>road</sub>. Each integer is space seperated.

* Each line following that will have two integers describing a road for use between cities *u<sub>i</sub>* and *v<sub>i</sub>*. Each integer is space seperated.

## The Output

Each query should have a result displayed that is the integer denoting the minimum cost of making town centers accessible to all the citizens.

The following example includes two queries (denoted by the first line having a 2). The subsequent queries then have a definition line of [3,2,2,1] and [6,6,2,5] respectively. Then below those query definition lines are the road definitions between the cities, and respectively the town centers.

**Sample**

```
2
3 3 2 1
1 2
3 1
2 3
6 6 2 5
1 3
3 4
2 4
1 2
2 3
5 6
```

## The Output

```
4
12
```

Alright, so here's how I've worked through these samples.

