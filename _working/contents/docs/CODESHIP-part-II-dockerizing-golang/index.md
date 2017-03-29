---
title: CODESHIP part II dockerizing golang
author: Adron Hall
date: 2016-11-20:03:40:46
template: doc.jade
---
Previously in this series I've put together all of the basic elements to insure I have a working build to develop from. This insures I have the ability to make changes rapidly, change direction when needed, insure the code base is always building, tested, and able to be deployed. If you want to catch up and follow along step through the previous article of the series [here](#part1).

In this article I'm going to start stepping toward a working services product, and provide a description and details of what I intend to build.

## Application Description

The idea behind this application is to generate data. However I don't want to create just a simple data generator alone. Instead I want a system which can generate data and also place it into an appropriate location after generating the data. With this basic setup I would need 2 key pieces of information to pass along to the API, so that it can then generate the data and put the data into the location designated.

## Core Application Goals

* Provide an API that accepts parameters, via a schema, that then will be used to generate and identify where to put the data after generation.
* In the schema, the basic data will describe the structure of the data store in which the generated data will be inserted.
* In the schema, I'll also want to be able to designate the type, and how many of the specific piece of data to generate.

I've created an example below, to provide an idea of what would be passed into the API. At this point I'm not trying to determine exactly how something would work, specific criteria, or the details of verifying the data, but just simply a workflow to achieve basic functionality around the core goals.

```javascript
[
  {
    "schema": "relational",
    "database": "postgresql",
    "connection": [
      {
        "connectionData": "stringForConnectionEtc",
        "username": "theUser",
        "password": "thePassword",
        "otherConnectionParam": "TheOtherValue"
      }
    ],
    "structure": [
      {
        "table": "Users",
        "generate": "4234908",
        "columns": [
          {"name": "id", "type": "uuid"},
          {"name": "firstname", "type": "firstname"},
          {"name": "lastname", "type": "lastname"},
          {"name": "email_address", "type": "email"}
        ]
      },
      {
        "table": "Addresses",
        "generate": "2323498",
        "columns": [
          {"name": "id", "type": "uuid"},
          {"name": "userFkId", "type": "uuid", "keyParentTable": "Users", "keyParentColumn": "id"},
          {"name": "street", "type": "address"},
          {"name": "city", "type": "city"},
          {"name": "state", "type": "state"},
          {"name": "postalcode", "type": "zip"}
        ]
      },
      {
        "table": "Transactions",
        "generate": "1432434908",
        "columns": [
          { "name": "id", "type": "uuid" },
          {"name": "userFkId", "type": "uuid", "keyParentTable": "Users", "keyParentColumn": "id"},
          { "name": "transaction", "type": "money" },
          { "name": "stamp", "type": "date" }
        ]
      }
    ]
  }
]
```

This example covers the core features. I've setup a schema and database key value pair, which I've set here to a relational schema setup for a Postgresql relational database. The connection parameter would be an array of key value pairs that would have the necessary information for connecting to the database. Below that the structure is where the database, which will be filled with generated data, is described.

At this point there are many other stories and feature requests I could come up with. At this point I know enough of the story to start building out some more of the systemic elements that are needed. I'll get right into that and step back into describing features after getting more of a feel for building this API service.

## Next Step Dependencies

I really need to get into the services at this point. Get something working to actually work from. Similar to how I have already put together the actual build with Codeship Pro. At the end of the last article in this series I had written a *hello world* style service, but that won't cut it. For this I want to use something that has features and capabilities focused around a service. This could and should cut back on a lot of the standard work that is needed. For this I'll use [go-kit](https://github.com/go-kit/kit).

To get this library, I use the standard [Go Get](https://golang.org/cmd/go/) command. This command will retrieve an available library for use, creating a dependency within my project. In this case I want to get the go-kit and start using it.

`go get github.com/go-kit/kit`

Go-kit focuses on a few key goals. The framework is designed to operate in a heterogenous environment, with the intent to communicate with any and all non go-kit services. RPC is the primary messaging pattern, it includes pluggable transport and serialization, and is designed to operate with existing infrastructures.

## Build Some Basic Features

I'll need a service that accepts JSON, and then can act on that JSON. So the first thing I need to do is to spool up a service with go-kit. To build out this initial business logic I'll start with an interface. This interface will then have an implementation based on this interface's contract.

```
type TellMeAboutJsonService interface {
	TellMeAbout(string) (string, error)
	Elements(string) int
}
```

Next I'll add a structure variable.

```
type tellMeAboutJsonService struct{}
```

Now the implementation of the interface for the `TellMeAbout` and `Elements` functions.

```
func (tellMeAboutJsonService) TellMeAbout(s string) (string, error) {
	if s == "" {
		return "", ErrEmpty
	}

	return s, nil
}

func (tellMeAboutJsonService) Elements(s string) int {
	return len(s)
}
```

Now I'll need some request and response variable object declarations too. These read like this.

```
type tellMeAboutRequest struct {
	S string `json:"s"`
}

type tellMeAboutResponse struct {
	V   string `json:"v"`
	Err string `json:"err,omitempty"`
}

type elementsRequest struct {
	S string `json:"s"`
}

type elementsResponse struct {
	V int `json:"v"`
}
```

I'll also need to be able to decade and encode requests and responses too. Here I've added some basic JSON deoding using the JSON decoder wrapped in some standard error handling.

```
func decodeTellMeAboutRequest(_ context.Context, r *http.Request) (interface{}, error) {
	var request tellMeAboutRequest
	if err := json.NewDecoder(r.Body).Decode(&request); err != nil {
		return nil, err
	}
	return request, nil
}

func decodeElementsRequest(_ context.Context, r *http.Request) (interface{}, error) {
	var request elementsRequest
	if err := json.NewDecoder(r.Body).Decode(&request); err != nil {
		return nil, err
	}
	return request, nil
}

func encodeResponse(_ context.Context, w http.ResponseWriter, response interface{}) error {
	return json.NewEncoder(w).Encode(response)
}
```

Now I'll setup the end points. For each go-kit service there is an end point, which basically what will become an access point made available via a URI that HTTP requests can be made against. For handling JSON that I'll pass in, as previously described in this article, I've setup the `makeTellMeAboutEndpoint` to handle this processing, and for the `makeElementsEndpoint` for counting the elements in JSON. The later isn't specifically needed immediately, but I can use it to do some simple testing, experimentation, and manipulation of JSON while I work to build this API.

For both of these functions, I've writting some extremely basic code just to be able to, at this point, verify that they work. The `makeTellMeAboutEndpoint` takes the JSON data and processes it in a basic way, and the elements simply provides a count of characters at this time. Again, just working on insuring a basic working element, and then I can iterate on additional processing of JSON data and such. *Small steps, make the bigger bridges possible!*

```
func makeTellMeAboutEndpoint(svc TellMeAboutJsonService) endpoint.Endpoint {
	return func(ctx context.Context, request interface{}) (interface{}, error) {
		req := request.(tellMeAboutRequest)
		v, err := svc.TellMeAbout(req.S)
		if err != nil {
			return tellMeAboutResponse{v, err.Error()}, nil
		}
		return tellMeAboutResponse{v, ""}, nil
	}
}

func makeElementsEndpoint(svc TellMeAboutJsonService) endpoint.Endpoint {
	return func(ctx context.Context, request interface{}) (interface{}, error) {
		req := request.(elementsRequest)
		v := svc.Elements(req.S)
		return elementsResponse{v}, nil
	}
}
```

Finally the main function.

```
func main() {
	svc := tellMeAboutJsonService{}

	tellMeAboutHandler := httptransport.NewServer(
		makeTellMeAboutEndpoint(svc),
		decodeTellMeAboutRequest,
		encodeResponse,
	)

	elementsHandler := httptransport.NewServer(
		makeElementsEndpoint(svc),
		decodeElementsRequest,
		encodeResponse,
	)

	// The URI Endpoints.
	http.Handle("/tellmeabout", tellMeAboutHandler)
	http.Handle("/elements", elementsHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
```

In the main function all these pieces come together. I start by setting variable `svc` to the interface with `svc := tellMeAboutJsonService{}`. Next I assign some handlers to deal with the http communication with the various end points I'll create. This is done with the assignments of `tellMeABoutHandler` and `elementsHandler`, which is assigned via a call to `NewServer` made availble via the `httptransport` library. Using this function I then pass in the end point with the svc variable interface contract, decade, and encode for each of the specific http servers handling the two endpoints. Finally the two end points are set for the handlers with `http.Hanlde("/uri_path", handler)`. Wrapping up the main method is the call to `http.ListenAndServe` set to port 8080 and passed into `log.Fatal` to handle errors.

Now when I run this service, I can execute http calls against the end points with curl. To test this service out I start it by running the service with the basic Go command *Run*.

```
go run main.go
```

With that running in one terminal window I can execute http requests against it now. For example I'll take the above JSON and send it to the first end point with this command.

```
curl -XPOST -d'{"s":"A small sample of JSON data."}' localhost:8080/tellmeabout
```

The result returns in the terminal with `{"v":"A small sample of JSON data."}`.

Trying that same sample against the count of elements, I get back the character count as expected.

```
curl -XPOST -d'{"s":"A small sample of JSON data."}' localhost:8080/elements
```

The result displays a simple `{"v":28}`. Now, the next step is to actually process some more legitimate JSON that looks more like the configuration example above.
