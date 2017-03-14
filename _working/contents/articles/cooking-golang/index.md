---
title:  A Go UUID Solution - Cooking Go - Issue 001 
author: Adron Hall
date: 2017-03-12 22:16:24
template: article.jade
---
<div class="image float-right">
    ![Go Mascot](golang-mascot.png)
</div>

Want a UUID generator for your Go code? It's likely you'll need one sometime. Well here's a short code snippet and a review of one of the available UUID libraries available.

The library is avaliable at [https://github.com/satori/go.uuid](https://github.com/satori/go.uuid).

With test coverage this library supports the following UUID types. I'll elaborate on what each of these types are after a code snippet or two.

* Version 1, based on timestamp and MAC address (RFC 4122)
* Version 2, based on timestamp, MAC address and POSIX UID/GID (DCE 1.1)
* Version 3, based on MD5 hashing (RFC 4122)
* Version 4, based on random numbers (RFC 4122)
* Version 5, based on SHA-1 hashing (RFC 4122)

First step. Get the library.

```shell-script
go get github.com/satori/go.uuid
```

<span class="more"></span>

Next I whipped up a code file with the example code. I've called mine *[uuid_generation.go]()*.

<script src="https://gist.github.com/Adron/c7225ebc07058f443482925a4565afee.js"></script>


Stepping through the code, the import includes the library being used.

```
"github.com/satori/go.uuid"
```

Then at the very beginning of the code a new UUID v4 is created.

```
u1 := uuid.NewV4()
```

In the example, a few lines down, there is also code around parsing a UUID.

```
u2, err := uuid.FromString("6ba7b810-9dad-11d1-80b4-00c04fd430c8")
```

I wanted to insure the other functions worked for the other versions so I added some code to create and print out each of them. At the same time, I've added what each of the versions are as I worked through creating them.

**Version 1**

A version 1 UUID concatenates the 48-bit MAC address of the machine creating the UUID with a 60-bit timestamp. If the process clock does not advance fast enough, there is a 14-bit clock sequence that extends the timestamp to insure uniqueness. Based on these creation parameters there is a maximum of 18 sextrillion version 1 UUIDs that can be generated per node. So ya know, don't get carried away or anything.  :P

It's also important to note, albeit obviously, that this UUID can be tracked back to the MAC Address that was used to create it.

The code for this UUID creation is shown above in the first example.

**Version 2**

Version 2 is reserved for DCE Security UUIDs. It's a bit light on details in the RFC ([4122](https://www.ietf.org/rfc/rfc4122.txt)). Even though the RFC is light on details, the [DCE 1.1 Authentication and Security Services](http://pubs.opengroup.org/onlinepubs/9696989899/chap5.htm#tagcjh_08_02_01_01) specification clarifies a bit more. Overall this UUID is generally similar to a version 1 UUID except the least significant 8 bits of the clock sequence (clock_seq_low) are replaced by local domain numbers. The least significant 32 bits of the timestamp replaced by an integer identifier.

Updated code with a working example of the specific domains used to create a v2 UUID.

<script src="https://gist.github.com/Adron/738b30ce93d5cd0efc02c0a4f43ce8a1.js"></script>

**Version 3 and 5**

Version 3 and 5 are similar UUIDs generated from hashing a namespace identifier and name. Version 5 uses SHA1 and version 3 uses MD5 as the hashing algorithm. The namespace identifier itself is a UUID and is used to represent the namespaces for URLs, fully qualified domain names (FQDNs), object identifiers, and X.500 distinguished names. Other UUIDs could be used as namespace designators, but the aforementioned are usually used.

To note, RFC 4122 refers version 5 (SHA1) over version 3 (MD5), and suggests against either as security credentials.

Here's the added examples of version 3 and 5.

<script src="https://gist.github.com/Adron/b8864c5e0d652f8ca14eb154e806a3bd.js"></script>

Enjoy those UUIDs, happy coding!