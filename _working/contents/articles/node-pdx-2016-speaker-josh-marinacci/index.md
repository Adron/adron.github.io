---
title: MMOWAM - Build Server-less Games with a DSN by Josh Marinacci
author: Adron Hall
date: 2016-06-04
template: article.jade
---

[![Node PDX 2016](nodepdx-2016-logo.png)](http://nodepdx.org)

<div class="image float-left">
    ![Joel Lord](joel-lord.jpg)
</div>

Josh is an O’Reilly author, developer advocate, and recovering engineer. He is
currently head of the developer evangelism team at PubNub. Previously he worked
as a UI researcher at Nokia, and a developer advocate at Palm and Sun. He is
passionate about user interfaces and education. Josh lives in sunny Eugene,
Oregon.

<span class="more"></span>

Josh will be talking about building a multiplayer casual game for fun. Well, it’s fun until you have to write a server
component to run it. Now you have to implement game matching, keeping clients in
sync, in game chat, score tracking and more. In this Josh will show you how to
use a Data Stream Network (DSN) write a game without any server at all. The
network itself can connect users, load clients, and keep everything in sync
without having to learn distributed computing programming. Josh will build and
play a MMOWAM (Massively Multiplayer Online Whack-A-Mole) game to show how easy
it can be.

- game MMOWAM (whack-a-mole)
- show mini version of each player on dashboard
- show current score / level
- show how much is left
- random number syncing to ensure everyone has the same board
- use a random channel w/ tiny UID to let anyone join
- show number of players
- start when 4 players in? one player hit’s start? let all player see total count as well and status of the other players