---
title: Portland Biketown Launches - Check out the API
author: Adron Hall
date: 2016-07-21 08:13
template: article.jade
---
Good morning Portland! After a few years of hiccups, the Portland Bike Share has finally gotten started! We can thank our corporate overlords over at Nike for kicking in that last chunk of millions to get a bike and station layout that is absolutely superb!

For a little bit more about the opening day and metrics on uses check out [Bike Portland](http://bikeportland.org/) has posted [Over 2,300 trips taken on Biketown bike share in first 24 hours](http://bikeportland.org/2016/07/20/over-2300-trips-taken-on-biketown-bike-share-in-first-24-hours-187922), [“This is awesome!” Photos and notes from the Biketown launch event](http://bikeportland.org/2016/07/19/bike-share-is-alive-photos-and-recap-from-the-launch-event-187867), and others.

## Biketown PDX!

Alright, before diving into the API, let's discuss the actual way the system works. There are several components to how things go, but it involves the ***workflow*** of ***joining***, then ***unlocking***, ***riding***, and then ***locking*** it back up. At least, that's the basic workflow, but there's obviously a bit more understanding needed to know what to actually do with the bike share. In the next few sections, I'll break this into ***Workflow***, ***systemic geographic mapping***, and ***WTF***.
 
### Workflow

The first step of the workflow is joining. There's three ways to do this: single ride, day pass, or annual membership. The single ride is $2.50 per trip. The day pass is $12 a day and the annual membership is $12 per month. Now each of these prices are pretty straight forward, but there are indeed a few little gotchas here and there. Nothing that would break the bank, but let's talk more about this first step.

* *Single Ride* - The single ride is good if you've arrived somewhere but have a short distance to go. Like say you arrive at Pioneer Square on the MAX, and want to get over to the east side real quick around area Burnside. Obviously using transit to get back over the Burnside is an awkward mess, so jumping on a Biketown bike is a perfect solution. This is where the quick $2.50 ride comes into play. Now theoretically most human beings could clear Pioneer Square clear up to about 20th & Burnside in under 30 minutes. However, this is one of the gotchas - exceed 30 minutes and it is 10 cents a minute after that. Not a big deal, but if you didn't read the fine print it'll sneak up on ya. There's one more note to this situation though, it isn't all penalty fees. When you bring your bike back to the station you actually get a $1.00 account credit! So really, if you use the bike share even somewhat regularly, such as once or twice a month, your price really ends up being about a $1.50 per ride instead of $2.50.

* *Day Pass* - This basically provides 180 minutes per day and an unlimited number of rides. Which this dual qualifier just doesn't sound right. If I can have unlimited rides, but am limited to 180 minutes, it doesn't sound like unlimited rides. Grumble grumble *nothing bugs me like poor logic applied in real world business*. But anyway, that's what is written. The other add, but benificial thing is that if you get a day pass, you can expand on that day pass to take out 4 additional bikes at a time, the first bike counts as the day pass purchaser's bike, then the other 3 are only $6 per hour, nor do these bikes count toward the 180 minutes. Overall, sounds like a deal, but it's also attached to that oddly worded logic of the day pass deal. I guess it works out. One the 180 minutes is exceed, it's 10 cents a minute (so not unlimited rides, but just this...) and upon returning the bike to a rack station, a $1 is applied back to the account as credit.

* *Annual Membership* - This is the account I bought, partially to get into the founders 1000. Which I'm a proud member of. Basically I get extra benifits, but even purchasing one now, post the first founders round of purchasers gets you a good deal. The $12 a month cost gets you unlimited rides, with 90 minutes of ride time included per day. Over 90 minutes is 10 cents a minute. All the other specs are basically the same, but this is a great deal if you want to insure you have easy access at any time to the bike share.

* *Other Notes* - It's important to note also, that if you don't park the bike back at a Biketown rack it's $2.00 within the system area and $20 outside the system area. The later price can hit the piggy bank a bit. If you're curious what the service area is, check out the *Systemic Geographic Mapping* section below. If you somehow manage to ***lose*** a bike, heaven forbid, you'll owe a  **$1500.00** whopper, which is big enough they'll nail your ass in small claims for that.



### Systemic Geographic Mapping

### WTF! Weeeeeeee!  :)


There are a set of public GBFS (General Bikeshare Feed Specification) feeds here: http://biketownpdx.socialbicycles.com/opendata/gbfs.json

We're using those to display available bikes at nearby stations on Transit Appliance displays:

​

There is also an authenticated API with additional info that I have not explored in detail: https://app.socialbicycles.com/developer


https://app.socialbicycles.com/developer



http://bikeportland.org/2016/07/20/over-2300-trips-taken-on-biketown-bike-share-in-first-24-hours-187922



<img class="img-responsive" src="./elasticon-tour-2015-in-seattle/streamset3.jpg" />

<div class="image float-right">
    ![Streamsets](streamset2.jpg)
</div>

<span class="more"></span>

